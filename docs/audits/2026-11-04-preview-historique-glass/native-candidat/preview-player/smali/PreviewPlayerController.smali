.class public final Lcom/melodix/music/PreviewPlayerController;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;
.implements Ljava/lang/Runnable;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/view/View$OnTouchListener;


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

.field private dragging:Z

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

.field private independentObservation:J

.field private independentObservationAt:J

.field private intervalCount:I

.field private intervalIndex:I

.field private final intervals:[J

.field private likedCollection:Z

.field private likedObservation:Ljava/lang/String;

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

.field private receivedAt:J

.field private remainingText:Ljava/lang/String;

.field private rowsAt:J

.field private seekAt:J

.field private final seekDiagAge:[J

.field private final seekDiagBaseline:[J

.field private final seekDiagCallback:[J

.field private final seekDiagConfirm:[J

.field private seekDiagCount:I

.field private final seekDiagDifferent:[J

.field private seekDiagIndex:I

.field private final seekDiagOutcome:[Ljava/lang/String;

.field private final seekDiagRelease:[J

.field private final seekDiagResult:[Ljava/lang/String;

.field private final seekDiagSeq:[J

.field private seekDiagSequence:J

.field private final seekDiagSubmit:[J

.field private seekFallbackAt:J

.field private seekFallbackPosition:J

.field private seekPending:Z

.field private seekSerial:J

.field private seekTarget:J

.field private seekWeb:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/webkit/WebView;",
            ">;"
        }
    .end annotation
.end field

.field private serial:J

.field private shownPlaying:Z

.field private stageAtRows:Ljava/lang/String;

.field private staleWaitingObserved:Z

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

    .line 158
    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/16 v4, 0x8

    const-wide/16 v2, -0x1

    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    .line 43
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 48
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    .line 49
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    .line 50
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    .line 51
    new-array v0, v4, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    .line 52
    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 53
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    .line 134
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 135
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v0, "Temps restant : \u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 138
    const-string v0, "none"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 142
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 143
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 144
    const/16 v0, 0x78

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 146
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 149
    new-array v0, v5, [Landroid/animation/ObjectAnimator;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 150
    new-array v0, v5, [Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 152
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 153
    const/16 v0, 0x3c

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 156
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 160
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 171
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    .line 172
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 173
    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 186
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 225
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    return-object v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    return-object v0
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    return-wide v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerController;D)V
    .locals 1

    .prologue
    .line 136
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 133
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerController;D)V
    .locals 1

    .prologue
    .line 136
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return v0
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 248
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 342
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 226
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return v0
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 133
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return-void
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return v0
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return-void
.end method

.method static synthetic access$25(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 331
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method static synthetic access$26(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 302
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return-void
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 133
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    return-wide v0
.end method

.method private cancelSeek()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 71
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    const-string v0, "annul\u00e9 (identit\u00e9 chang\u00e9e ou invalide)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 72
    :cond_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 73
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

    .line 241
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    invoke-static {v12, v13, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    rem-long v2, v0, v6

    div-long v4, v0, v6

    rem-long/2addr v4, v6

    const-wide/16 v6, 0xe10

    div-long/2addr v0, v6

    .line 242
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

.method private correctionInProgress(J)Z
    .locals 9

    .prologue
    const-wide/16 v6, 0x0

    .line 339
    const-wide v0, 0x40af400000000000L    # 4000.0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v2, v2

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    .line 340
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    cmpl-double v2, v2, v6

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v2, p1, v2

    long-to-double v2, v2

    cmpg-double v0, v2, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private delta(J)Ljava/lang/String;
    .locals 5

    .prologue
    const-wide/16 v2, 0x0

    .line 508
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
    .locals 13

    .prologue
    const/4 v12, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v4, 0x0

    const-wide/16 v10, 0x0

    .line 525
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    .line 526
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    :cond_0
    const-string v0, "ind\u00e9termin\u00e9e (phases manquantes ou non s\u00e9quentielles)"

    .line 532
    :goto_0
    return-object v0

    .line 527
    :cond_1
    const/4 v0, 0x5

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
    aput-wide v0, v5, v8

    .line 528
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_3

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    :goto_2
    sub-long v0, v2, v0

    aput-wide v0, v5, v9

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    sub-long/2addr v0, v2

    aput-wide v0, v5, v12

    const/4 v0, 0x4

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    sub-long/2addr v2, v6

    aput-wide v2, v5, v0

    .line 529
    const/4 v0, 0x5

    new-array v6, v0, [Ljava/lang/String;

    const-string v0, "attente pont"

    aput-object v0, v6, v4

    const-string v0, "navigation \u2192 page pr\u00eate"

    aput-object v0, v6, v8

    const-string v0, "page/pont \u2192 lignes re\u00e7ues"

    aput-object v0, v6, v9

    const-string v0, "r\u00e9ception \u2192 rendu natif"

    aput-object v0, v6, v12

    const/4 v0, 0x4

    const-string v1, "rendu \u2192 frame"

    aput-object v1, v6, v0

    .line 530
    const-wide/16 v2, -0x1

    const-string v0, "ind\u00e9termin\u00e9e"

    move v1, v4

    .line 531
    :goto_3
    array-length v4, v5

    if-lt v1, v4, :cond_4

    .line 532
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

    .line 527
    :cond_2
    const-wide/16 v0, -0x1

    goto :goto_1

    .line 528
    :cond_3
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_2

    .line 531
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
    .line 226
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 5

    .prologue
    .line 521
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
    .locals 3

    .prologue
    .line 228
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double v0, v0

    :goto_0
    return-wide v0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    goto :goto_0
.end method

.method private positionUnderlying(J)D
    .locals 13

    .prologue
    const-wide/16 v0, 0x0

    const-wide/16 v10, 0x0

    .line 231
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v2, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 238
    :goto_0
    return-wide v0

    .line 232
    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v2, p1, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 233
    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v4, :cond_1

    move-wide v0, v2

    .line 236
    :cond_1
    const-wide v4, 0x40af400000000000L    # 4000.0

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v6, v6

    invoke-static {v10, v11, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    const-wide/high16 v8, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v6, v8

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    .line 237
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    long-to-double v2, v2

    div-double/2addr v2, v4

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    mul-double/2addr v2, v6

    .line 238
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v4, v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    long-to-double v0, v0

    add-double/2addr v0, v6

    add-double/2addr v0, v2

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    goto :goto_0
.end method

.method private progressStopReason()Ljava/lang/String;
    .locals 4

    .prologue
    .line 510
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_0

    const-string v0, "\u00e9tat du lecteur indisponible"

    .line 518
    :goto_0
    return-object v0

    .line 511
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_1

    const-string v0, "pause demand\u00e9e"

    goto :goto_0

    .line 512
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    goto :goto_0

    .line 513
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "lecture en pause"

    goto :goto_0

    .line 514
    :cond_3
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_4

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    goto :goto_0

    .line 515
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_5

    const-string v0, "position ou dur\u00e9e indisponible"

    goto :goto_0

    .line 516
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_6

    const-string v0, "mouvement arr\u00eat\u00e9"

    goto :goto_0

    .line 517
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

    .line 518
    :cond_7
    const-string v0, "animation active"

    goto :goto_0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 362
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

    .line 363
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 364
    const-string v0, "Lecture arr\u00eat\u00e9e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucune lecture en cours"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 362
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
    .line 332
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_1

    .line 337
    :cond_0
    :goto_0
    return-void

    .line 333
    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_3

    const v1, 0x7f080121

    move v3, v1

    .line 334
    :goto_1
    const v1, 0x7f090238

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f09023e

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 335
    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 336
    :cond_2
    instance-of v0, v2, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, v2

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 333
    :cond_3
    const v1, 0x7f080122

    move v3, v1

    goto :goto_1
.end method

.method private renderProgress()V
    .locals 12

    .prologue
    .line 249
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 271
    :cond_0
    :goto_0
    return-void

    .line 250
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 251
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 252
    const v1, 0x7f09024a

    const-string v2, "\u2014"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    const-string v2, "\u2014"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 253
    const v1, 0x7f09024d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v1, 0x7f09023d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 254
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 255
    if-nez v0, :cond_2

    const/4 v1, 0x0

    .line 256
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

    .line 257
    check-cast v1, Landroid/widget/TextView;

    const-string v0, "Temps restant : \u2014"

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 255
    :cond_2
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 260
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-long v4, v4

    const-wide/16 v6, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v8, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 261
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

    .line 262
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

    .line 263
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

    .line 264
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

    .line 265
    const v2, 0x7f09024d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v2, 0x7f09023d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 266
    const v1, 0x7f09024a

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 267
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 268
    if-nez v0, :cond_7

    const/4 v1, 0x0

    .line 269
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

    .line 270
    check-cast v1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 268
    :cond_7
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_2
.end method

.method private report()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v2, 0x0

    const-wide/16 v10, 0x0

    .line 535
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 536
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v0, v10

    if-gez v0, :cond_3

    const-string v0, "Appui : \u2014\nCommande re\u00e7ue du pont : "

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 540
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 541
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_4

    const-string v0, "\u2014"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 543
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_5

    const-string v0, "\u2014"

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 545
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_6

    const-string v0, "\u2014"

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    const-string v0, "\nSource position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    const-string v0, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_7

    const-string v0, "oui"

    :goto_4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    const-string v0, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_8

    const-string v0, "oui"

    :goto_5
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    const-string v0, " ; \u00e2ge de la mesure : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_9

    const-string v0, "\u2014"

    :goto_6
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    const-string v0, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_a

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    :goto_7
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {p0, v0, v1, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 556
    const-string v0, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    const-string v0, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v0, :cond_0

    const-string v0, "\nLik\u00e9s : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 559
    const-string v1, " ; rendu natif : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_b

    const-string v0, "non observ\u00e9"

    :goto_8
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    :cond_0
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    const-string v0, " ; waiting-bridge avec lignes : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_c

    const-string v0, "ind\u00e9termin\u00e9"

    :goto_9
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 562
    const-string v0, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v0, :cond_1

    const-string v0, " aucun"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    move v0, v2

    .line 564
    :goto_a
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-lt v0, v1, :cond_f

    .line 576
    const-string v0, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    const-string v0, "\nIntervalles position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v0, :cond_2

    const-string v0, "\u2014"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    move v0, v2

    .line 579
    :goto_b
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-lt v0, v1, :cond_11

    .line 584
    const-string v0, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    :goto_c
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-lt v2, v0, :cond_13

    .line 589
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 536
    :cond_3
    const-string v0, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    goto/16 :goto_0

    .line 541
    :cond_4
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

    .line 543
    :cond_5
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

    .line 545
    :cond_6
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

    .line 548
    :cond_7
    const-string v0, "non"

    goto/16 :goto_4

    .line 550
    :cond_8
    const-string v0, "non"

    goto/16 :goto_5

    .line 552
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long/2addr v4, v6

    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->max(JJ)J

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

    .line 555
    :cond_a
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto/16 :goto_7

    .line 559
    :cond_b
    const-string v0, "lignes visibles"

    goto/16 :goto_8

    .line 561
    :cond_c
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v4, "waiting-bridge"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v0, :cond_e

    :cond_d
    const-string v0, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    goto/16 :goto_9

    :cond_e
    const-string v0, "non"

    goto/16 :goto_9

    .line 565
    :cond_f
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    sub-int/2addr v1, v4

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v4, v4

    add-int/2addr v1, v4

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v4, v4

    rem-int/2addr v1, v4

    .line 566
    const-string v4, "\n#"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aget-wide v6, v5, v1

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " rel\u00e2chement : 0 ms ; envoi WebView : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 567
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v6, v5, v1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    aget-wide v8, v5, v1

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    const-string v4, " ; fin JS : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v6, v5, v1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    aget-wide v8, v5, v1

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 569
    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    const-string v4, " ; premi\u00e8re position UI diff\u00e9rente : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v6, v5, v1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    aget-wide v8, v5, v1

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    const-string v4, " ; position UI confirm\u00e9e : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v6, v5, v1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    aget-wide v8, v5, v1

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 572
    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    const-string v4, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 574
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v6, v5, v1

    cmp-long v5, v6, v10

    if-gez v5, :cond_10

    const-string v1, "\u2014"

    :goto_d
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_a

    .line 574
    :cond_10
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v6, v6, v1

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ms"

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 580
    :cond_11
    if-lez v0, :cond_12

    const-string v1, ", "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 581
    :cond_12
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

    .line 582
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v4, v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " ms"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_b

    .line 586
    :cond_13
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

    .line 587
    const-string v1, "\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v0, v4, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_c
.end method

.method private scheduleFrame()V
    .locals 2

    .prologue
    .line 343
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->correctionInProgress(J)Z

    move-result v0

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

    .line 344
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 4

    .prologue
    .line 282
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 283
    :cond_0
    return-void
.end method

.method private seekDiagFinish(Ljava/lang/String;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 55
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v0, v0, v1

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v0, v0, v1

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-object p1, v0, v1

    .line 57
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 3

    .prologue
    const/16 v2, 0x3e8

    .line 273
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 274
    instance-of v1, v0, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 275
    check-cast v0, Landroid/widget/ProgressBar;

    .line 276
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 277
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v1

    if-eq v1, p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 279
    :cond_1
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 299
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v2, v0, p1

    .line 300
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

    .line 301
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

    .line 303
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 304
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v1, v5, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    .line 305
    :goto_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v6

    .line 306
    if-eqz v0, :cond_1

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v5, :cond_1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    if-eqz v1, :cond_1

    .line 307
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

    .line 306
    cmpg-double v1, v6, v8

    if-gez v1, :cond_1

    .line 308
    :goto_1
    new-array v5, v10, [I

    fill-array-data v5, :array_0

    .line 309
    :goto_2
    array-length v1, v5

    if-lt v2, v1, :cond_2

    .line 330
    return-void

    :cond_0
    move v1, v3

    .line 304
    goto :goto_0

    :cond_1
    move v3, v2

    .line 306
    goto :goto_1

    .line 310
    :cond_2
    if-nez v0, :cond_4

    move-object v1, v4

    .line 312
    :goto_3
    if-eqz v3, :cond_7

    instance-of v6, v1, Landroid/widget/ProgressBar;

    if-eqz v6, :cond_7

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 313
    check-cast v1, Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 314
    instance-of v6, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v6, :cond_7

    .line 315
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 316
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    const v6, 0x102000d

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 319
    :goto_4
    if-nez v1, :cond_5

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 309
    :cond_3
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 310
    :cond_4
    aget v1, v5, v2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_3

    .line 320
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

    .line 321
    :cond_6
    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 322
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v1, v6, v2

    .line 323
    const-string v6, "alpha"

    new-array v7, v10, [I

    fill-array-data v7, :array_1

    invoke-static {v1, v6, v7}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 324
    const-wide/16 v6, 0x640

    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 325
    invoke-virtual {v1, v10}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 326
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 327
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v6, v2

    .line 328
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_5

    :cond_7
    move-object v1, v4

    goto :goto_4

    .line 308
    nop

    :array_0
    .array-data 4
        0x7f09024d
        0x7f09023d
    .end array-data

    .line 323
    :array_1
    .array-data 4
        0x96
        0xff
    .end array-data
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 245
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 246
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

    .line 247
    :cond_0
    return-void
.end method


# virtual methods
.method public activityCreated()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 188
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 198
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 192
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 194
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 195
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

    .line 196
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
    .line 280
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

    .line 297
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 504
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 507
    return-void
.end method

.method public attachSeek(Landroid/webkit/WebView;)V
    .locals 2

    .prologue
    .line 59
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 60
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    const/4 v1, 0x0

    .line 61
    :goto_0
    instance-of v0, v1, Landroid/widget/SeekBar;

    if-eqz v0, :cond_0

    move-object v0, v1

    .line 62
    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 63
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 65
    :cond_0
    return-void

    .line 60
    :cond_1
    const v1, 0x7f09023d

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_0
.end method

.method public begin(I)V
    .locals 2

    .prologue
    .line 499
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 500
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 501
    return-void
.end method

.method public command()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 502
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

    .line 346
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 347
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 360
    :cond_0
    :goto_0
    return-void

    .line 348
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 349
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    if-eqz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 350
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 351
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v0

    if-gtz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v2, v0, v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 353
    :cond_2
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 354
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 356
    :cond_3
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 357
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    .line 358
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 359
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v2, v2

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_5

    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->correctionInProgress(J)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_0
.end method

.method public loadState(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 163
    if-eqz p1, :cond_0

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 169
    :cond_0
    :goto_0
    return-void

    .line 164
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_3

    .line 165
    const-string v0, "waiting-bridge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 166
    :cond_2
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    goto :goto_0

    .line 168
    :cond_3
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 8

    .prologue
    .line 87
    if-eqz p3, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_1

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 88
    :cond_1
    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const/4 v6, 0x0

    const/16 v7, 0x3e8

    invoke-static {v7, p2}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v4, v6

    long-to-double v4, v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 89
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .prologue
    const-wide/16 v2, 0x0

    .line 75
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 76
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    double-to-long v6, v0

    .line 77
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    .line 78
    const-string v0, "remplac\u00e9 par un nouveau geste"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 80
    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "playing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    sub-long v0, v4, v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :goto_0
    add-long/2addr v0, v10

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    .line 81
    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 83
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 85
    :cond_1
    return-void

    :cond_2
    move-wide v0, v2

    .line 80
    goto :goto_0
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 132
    :goto_0
    return-void

    .line 93
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    .line 94
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_0

    .line 95
    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 96
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 97
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    .line 98
    :cond_3
    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v0

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    .line 99
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aput-wide v6, v0, v4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aput-wide v2, v0, v4

    .line 100
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    const-wide/16 v10, -0x1

    aput-wide v10, v8, v4

    aput-wide v10, v5, v4

    aput-wide v10, v1, v4

    aput-wide v10, v0, v4

    .line 101
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    const-wide/16 v8, 0x0

    cmp-long v0, v0, v8

    if-gez v0, :cond_4

    const-wide/16 v0, -0x1

    :goto_1
    aput-wide v0, v5, v4

    .line 102
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    aput-wide v8, v0, v4

    .line 103
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v1, "en attente"

    aput-object v1, v0, v4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    const-string v1, "en attente"

    aput-object v1, v0, v4

    .line 104
    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    double-to-long v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 105
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v0

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 106
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 107
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "playing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 108
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 109
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 110
    if-eqz v0, :cond_5

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "window.__sfPreviewSeek&&window.__sfPreviewSeek("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 112
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 113
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v10

    aput-wide v10, v2, v4

    .line 114
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v2, p0, v4, v6, v7}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 123
    :goto_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v1, p0, v8, v9}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 131
    const-wide/16 v2, 0x1388

    .line 123
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 101
    :cond_4
    const-wide/16 v0, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    sub-long v8, v2, v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto/16 :goto_1

    .line 122
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v1, "WebView indisponible"

    aput-object v1, v0, v4

    goto :goto_2
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 67
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 68
    :cond_0
    return v2
.end method

.method public phase(Ljava/lang/String;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 175
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_0

    if-nez p1, :cond_1

    .line 185
    :cond_0
    :goto_0
    return-void

    .line 176
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 177
    const-string v2, "rows-received"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    goto :goto_0

    .line 178
    :cond_2
    const-string v2, "liked-route-other"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v0, "page diff\u00e9rente"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 179
    :cond_3
    const-string v2, "liked-dom-empty"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v0, "page lik\u00e9s vue, aucune ligne DOM observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 180
    :cond_4
    const-string v2, "liked-dom-rows"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v0, "page lik\u00e9s vue, lignes DOM pr\u00e9sentes"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 181
    :cond_5
    const-string v2, "bridge-ready"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_6

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_0

    .line 182
    :cond_6
    const-string v2, "navigation"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_7

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    goto :goto_0

    .line 183
    :cond_7
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

    .line 184
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

    goto/16 :goto_0
.end method

.method public playlistOpened(Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    const-wide/16 v2, -0x1

    .line 200
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 201
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 202
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 203
    if-eqz p1, :cond_1

    const-string v0, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 204
    :cond_0
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 206
    :cond_1
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const-wide/16 v6, 0x0

    .line 208
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

    .line 209
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

    .line 211
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 212
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-lt v0, v2, :cond_2

    .line 222
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 223
    return-void

    .line 213
    :cond_2
    :try_start_1
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 214
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

    .line 215
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 216
    :cond_3
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 217
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_1

    .line 212
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public run()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 285
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 286
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 296
    :cond_0
    :goto_0
    return-void

    .line 287
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 288
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 289
    :cond_2
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_4

    const-string v0, "\u2014"

    .line 290
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

    .line 291
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

    .line 292
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

    .line 290
    aput-object v0, v4, v5

    .line 293
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 294
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 295
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    goto :goto_0

    .line 289
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

    .line 291
    :cond_5
    const-string v1, "non"

    goto :goto_2
.end method

.method public showDiagnostics()V
    .locals 5

    .prologue
    .line 593
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 602
    :goto_0
    return-void

    .line 594
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 595
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 596
    const-string v3, "Copier"

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v4, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 601
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 30

    .prologue
    .line 368
    :try_start_0
    new-instance v20, Lorg/json/JSONObject;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 369
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v22

    .line 370
    const-string v4, "previewProgressValid"

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 374
    const-string v4, "track"

    const-string v5, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "artist"

    const-string v6, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 375
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

    .line 376
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

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

    .line 377
    const-wide/16 v4, -0x1

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 379
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 480
    :cond_2
    :goto_0
    return-void

    .line 382
    :cond_3
    const-string v4, "track"

    const-string v5, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v4, "artist"

    const-string v5, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 383
    const-string v5, "previewTrackUri"

    const-string v6, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 384
    const-string v5, "previewPositionMs"

    const-wide/16 v6, -0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-string v5, "previewDurationMs"

    const-wide/16 v6, -0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 385
    const-string v6, "previewPlaybackState"

    const-string v5, "playing"

    const/4 v7, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_10

    const-string v5, "playing"

    :goto_1
    move-object/from16 v0, v20

    invoke-virtual {v0, v6, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 386
    const-string v6, "playing"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_32

    const-string v6, "paused"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_32

    const-string v5, "unknown"

    move-object/from16 v19, v5

    .line 387
    :goto_2
    const-string v5, "playing"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    .line 388
    const-string v5, "previewProgressValid"

    const/4 v6, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_11

    const-wide/16 v6, 0x0

    cmp-long v5, v12, v6

    if-lez v5, :cond_11

    const-wide/16 v6, 0x0

    cmp-long v5, v10, v6

    if-ltz v5, :cond_11

    cmp-long v5, v10, v12

    if-gtz v5, :cond_11

    const/4 v7, 0x1

    .line 389
    :goto_3
    invoke-static {v8}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_12

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_12

    const-wide/16 v14, 0x0

    cmp-long v5, v12, v14

    if-lez v5, :cond_12

    const/4 v5, 0x1

    move/from16 v18, v5

    .line 390
    :goto_4
    if-eqz v18, :cond_13

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v5, :cond_13

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 391
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v5, v14, v12

    if-nez v5, :cond_13

    .line 392
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 390
    :cond_4
    const/4 v5, 0x0

    move/from16 v17, v5

    .line 393
    :goto_5
    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v14

    .line 394
    if-nez v17, :cond_14

    if-eqz v7, :cond_14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-wide/from16 v26, v0

    const-wide/16 v28, 0x0

    cmp-long v5, v26, v28

    if-ltz v5, :cond_14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-wide/from16 v26, v0

    const-wide/16 v28, 0x7d0

    sub-long v26, v26, v28

    cmp-long v5, v10, v26

    if-gez v5, :cond_14

    const/4 v6, 0x1

    .line 395
    :goto_6
    if-eqz v7, :cond_15

    if-nez v17, :cond_5

    if-nez v6, :cond_5

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-wide/from16 v26, v0

    const-wide/16 v28, 0x0

    cmp-long v5, v26, v28

    if-ltz v5, :cond_5

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-wide/from16 v26, v0

    cmp-long v5, v10, v26

    if-eqz v5, :cond_15

    :cond_5
    const/4 v5, 0x1

    .line 396
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v9, :cond_16

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v9, :cond_16

    if-eqz v24, :cond_16

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v9, :cond_16

    if-nez v17, :cond_16

    const/4 v9, 0x1

    move/from16 v16, v9

    .line 397
    :goto_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move/from16 v25, v0

    .line 398
    const-string v9, "previewProgressSource"

    const-string v26, "none"

    move-object/from16 v0, v20

    move-object/from16 v1, v26

    invoke-virtual {v0, v9, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 399
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v26, "range"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v26, "media"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v26, "clock"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    const-string v9, "none"

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 400
    :cond_6
    move-object/from16 v0, p0

    iput-boolean v7, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 401
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 402
    if-eqz v17, :cond_7

    .line 403
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v14, -0x1

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 404
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/high16 v14, 0x7ff8000000000000L    # Double.NaN

    .line 405
    const-wide/16 v26, -0x1

    move-wide/from16 v0, v26

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-wide/from16 v0, v26

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 407
    :cond_7
    if-eqz v18, :cond_17

    :goto_9
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    if-eqz v18, :cond_18

    :goto_a
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 408
    if-eqz v18, :cond_19

    move-wide v8, v12

    :goto_b
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 409
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_8

    if-eqz v17, :cond_9

    :cond_8
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 412
    :cond_9
    const-string v4, "previewConfirmPositionMs"

    const-wide/16 v8, -0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 413
    if-eqz v18, :cond_b

    const-wide/16 v26, 0x0

    cmp-long v4, v8, v26

    if-ltz v4, :cond_b

    cmp-long v4, v8, v12

    if-gtz v4, :cond_b

    .line 414
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v4, :cond_a

    if-nez v17, :cond_a

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v4, :cond_a

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v20, v0

    aget-wide v26, v4, v20

    const-wide/16 v28, 0x0

    cmp-long v4, v26, v28

    if-ltz v4, :cond_a

    .line 415
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v20, v0

    aget-wide v26, v4, v20

    const-wide/16 v28, 0x0

    cmp-long v4, v26, v28

    if-gez v4, :cond_a

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v20, v0

    aget-wide v26, v4, v20

    cmp-long v4, v8, v26

    if-eqz v4, :cond_a

    .line 416
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v20, v0

    aput-wide v22, v4, v20

    .line 417
    :cond_a
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 419
    :cond_b
    const/4 v4, 0x0

    .line 420
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move/from16 v20, v0

    if-eqz v20, :cond_31

    if-nez v17, :cond_31

    .line 422
    if-eqz v24, :cond_1a

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v6, v22, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 423
    :goto_c
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v4, v6

    invoke-static {v12, v13, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 424
    const-wide/16 v6, 0x0

    cmp-long v6, v8, v6

    if-ltz v6, :cond_c

    cmp-long v6, v8, v12

    if-gtz v6, :cond_c

    .line 425
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 427
    :cond_c
    const-wide/16 v6, 0x0

    cmp-long v6, v8, v6

    if-ltz v6, :cond_d

    sub-long v4, v8, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/16 v6, 0x9c4

    cmp-long v4, v4, v6

    if-lez v4, :cond_1b

    .line 428
    :cond_d
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v4, :cond_e

    if-nez v24, :cond_e

    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 429
    :cond_e
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 430
    const-string v4, "unknown"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_f

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 431
    :cond_f
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 479
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

    .line 385
    :cond_10
    :try_start_1
    const-string v5, "paused"

    goto/16 :goto_1

    .line 388
    :cond_11
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 389
    :cond_12
    const/4 v5, 0x0

    move/from16 v18, v5

    goto/16 :goto_4

    .line 390
    :cond_13
    const/4 v5, 0x1

    move/from16 v17, v5

    goto/16 :goto_5

    .line 394
    :cond_14
    const/4 v6, 0x0

    goto/16 :goto_6

    .line 395
    :cond_15
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 396
    :cond_16
    const/4 v9, 0x0

    move/from16 v16, v9

    goto/16 :goto_8

    .line 407
    :cond_17
    const-string v8, ""

    goto/16 :goto_9

    :cond_18
    const-string v4, ""

    goto/16 :goto_a

    .line 408
    :cond_19
    const-wide/16 v8, -0x1

    goto/16 :goto_b

    .line 422
    :cond_1a
    const-wide/16 v4, 0x0

    goto/16 :goto_c

    .line 435
    :cond_1b
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v4, :cond_1c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v22, v4, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v6, "position UI proche de la cible"

    aput-object v6, v4, v5

    .line 436
    :cond_1c
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const/4 v4, 0x1

    .line 437
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 438
    const-wide/16 v10, -0x1

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 440
    :goto_d
    if-eqz v7, :cond_2c

    .line 441
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 442
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v7, :cond_1d

    if-nez v17, :cond_1d

    if-nez v6, :cond_1d

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-eqz v6, :cond_25

    .line 443
    :cond_1d
    long-to-double v6, v8

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 453
    :cond_1e
    :goto_e
    if-eqz v5, :cond_20

    .line 454
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1f

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1f

    if-eqz v24, :cond_1f

    .line 455
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v6, v22, v6

    aput-wide v6, v4, v5

    .line 456
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    rem-int/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 457
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    if-ge v4, v5, :cond_1f

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 459
    :cond_1f
    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 461
    :cond_20
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 462
    if-eqz v18, :cond_2b

    if-eqz v24, :cond_2b

    if-nez v16, :cond_2b

    const/4 v4, 0x1

    :goto_f
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 467
    :goto_10
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 468
    const-string v4, "unknown"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_22

    .line 469
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 470
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v4, :cond_21

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v24

    if-ne v0, v4, :cond_21

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 471
    :cond_21
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_22

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 473
    :cond_22
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 474
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

    .line 475
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_23

    const-string v4, "unknown"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_23

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v24

    if-eq v0, v4, :cond_24

    .line 476
    :cond_23
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 477
    :cond_24
    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    goto/16 :goto_0

    .line 444
    :cond_25
    if-eqz v4, :cond_26

    if-nez v24, :cond_26

    .line 445
    const-wide/16 v6, 0x0

    long-to-double v10, v12

    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v6, v8

    sub-double/2addr v6, v14

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_e

    .line 446
    :cond_26
    if-eqz v5, :cond_27

    if-nez v24, :cond_27

    if-nez v16, :cond_27

    .line 447
    long-to-double v6, v8

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_e

    .line 448
    :cond_27
    if-eqz v5, :cond_28

    if-nez v16, :cond_28

    .line 449
    const-wide/16 v6, 0x0

    long-to-double v10, v12

    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v6, v8

    sub-double/2addr v6, v14

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_e

    .line 450
    :cond_28
    if-eqz v25, :cond_29

    if-eqz v24, :cond_2a

    if-nez v16, :cond_2a

    :cond_29
    if-nez v25, :cond_1e

    if-eqz v24, :cond_1e

    .line 451
    :cond_2a
    const-wide/16 v6, 0x0

    long-to-double v10, v12

    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_e

    .line 462
    :cond_2b
    const/4 v4, 0x0

    goto/16 :goto_f

    .line 463
    :cond_2c
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_30

    if-nez v17, :cond_30

    if-eqz v18, :cond_30

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_30

    .line 464
    if-eqz v24, :cond_2d

    if-eqz v16, :cond_2e

    :cond_2d
    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 465
    :cond_2e
    if-eqz v24, :cond_2f

    if-nez v16, :cond_2f

    const/4 v4, 0x1

    :goto_11
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto/16 :goto_10

    :cond_2f
    const/4 v4, 0x0

    goto :goto_11

    .line 466
    :cond_30
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_10

    :cond_31
    move-wide v8, v10

    goto/16 :goto_d

    :cond_32
    move-object/from16 v19, v5

    goto/16 :goto_2
.end method

.method public tapPlayPause()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 482
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 483
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const/4 v2, -0x1

    .line 496
    :cond_0
    :goto_0
    return v2

    .line 484
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    .line 485
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

    .line 486
    :cond_2
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 487
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 488
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 489
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v3, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 495
    const-wide/16 v4, 0x1f40

    .line 489
    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 496
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_3
    move v0, v2

    .line 486
    goto :goto_1
.end method
