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

.field private static final MAX_DEVIATION_MS:J = 0x1388L

.field private static final MAX_OBSERVATION_AGE_MS:J = 0xbb8L

.field private static final MINI:I = 0x7f09024d

.field private static final MINI_BUTTON:I = 0x7f090238

.field private static final PAUSE_ICON:I = 0x7f080121

.field private static final PLAY_ICON:I = 0x7f080122

.field private static final RECONCILE_MS:J = 0x1f40L

.field private static firstCreateAt:J

.field private static firstHomeFrameMs:J

.field private static processHomeFrameMs:J

.field private static processStartAt:J

.field private static savedAbsenceAt:J

.field private static savedAnchor:J

.field private static savedArtist:Ljava/lang/String;

.field private static savedBase:D

.field private static savedCorrection:D

.field private static savedDuration:J

.field private static savedIdentity:Z

.field private static savedMeasurementAt:J

.field private static savedMeasurementPosition:J

.field private static savedMoving:Z

.field private static savedState:Ljava/lang/String;

.field private static savedTitle:Ljava/lang/String;

.field private static savedTrack:Ljava/lang/String;

.field private static savedValid:Z


# instance fields
.field private absenceAt:J

.field private absenceDuration:J

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

.field private previousPlaylistFrameMs:J

.field private progressSource:Ljava/lang/String;

.field private realPlaying:Z

.field private receivedAt:J

.field private remainingText:Ljava/lang/String;

.field private returnAt:J

.field private returnEventCount:I

.field private returnEventIndex:I

.field private final returnEvents:[Ljava/lang/String;

.field private returnSecondCount:I

.field private final returnSeconds:[Ljava/lang/String;

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
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 155
    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    .line 156
    const-string v0, ""

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    const-string v0, "unknown"

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    .line 175
    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/16 v4, 0x8

    const-wide/16 v2, -0x1

    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    .line 45
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 50
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    .line 51
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    .line 52
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    .line 53
    new-array v0, v4, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 55
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    .line 136
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 137
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v0, "Temps restant : \u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 139
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 140
    const-string v0, "none"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 145
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 146
    const/16 v0, 0x78

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 148
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 149
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    .line 151
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    .line 166
    new-array v0, v5, [Landroid/animation/ObjectAnimator;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 167
    new-array v0, v5, [Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 169
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 170
    const/16 v0, 0x3c

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 173
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 177
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 188
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 189
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 190
    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 203
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 244
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 245
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz v0, :cond_0

    .line 246
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 247
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 248
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 249
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 250
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 252
    :cond_0
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    return-object v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    return-object v0
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    return-wide v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerController;D)V
    .locals 1

    .prologue
    .line 138
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 135
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerController;D)V
    .locals 1

    .prologue
    .line 138
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 143
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return v0
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 281
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 388
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 259
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return v0
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 135
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return-void
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return v0
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return-void
.end method

.method static synthetic access$25(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 377
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method static synthetic access$26(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 348
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return-void
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 135
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    return-wide v0
.end method

.method private cancelSeek()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 73
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    const-string v0, "annul\u00e9 (identit\u00e9 chang\u00e9e ou invalide)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 74
    :cond_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 75
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

    .line 274
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    invoke-static {v12, v13, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    rem-long v2, v0, v6

    div-long v4, v0, v6

    rem-long/2addr v4, v6

    const-wide/16 v6, 0xe10

    div-long/2addr v0, v6

    .line 275
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

    .line 385
    const-wide v0, 0x40af400000000000L    # 4000.0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v2, v2

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    .line 386
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

    .line 570
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

    .line 587
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

    .line 588
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

    .line 594
    :goto_0
    return-object v0

    .line 589
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

    .line 590
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

    .line 591
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

    .line 592
    const-wide/16 v2, -0x1

    const-string v0, "ind\u00e9termin\u00e9e"

    move v1, v4

    .line 593
    :goto_3
    array-length v4, v5

    if-lt v1, v4, :cond_4

    .line 594
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

    .line 589
    :cond_2
    const-wide/16 v0, -0x1

    goto :goto_1

    .line 590
    :cond_3
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_2

    .line 593
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
    .line 259
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 5

    .prologue
    .line 583
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
    .line 261
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

    .line 264
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v2, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 271
    :goto_0
    return-wide v0

    .line 265
    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v2, p1, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 266
    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v4, :cond_1

    move-wide v0, v2

    .line 269
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

    .line 270
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    long-to-double v2, v2

    div-double/2addr v2, v4

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    mul-double/2addr v2, v6

    .line 271
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
    .line 572
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_0

    const-string v0, "\u00e9tat du lecteur indisponible"

    .line 580
    :goto_0
    return-object v0

    .line 573
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_1

    const-string v0, "pause demand\u00e9e"

    goto :goto_0

    .line 574
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    goto :goto_0

    .line 575
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "lecture en pause"

    goto :goto_0

    .line 576
    :cond_3
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_4

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    goto :goto_0

    .line 577
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_5

    const-string v0, "position ou dur\u00e9e indisponible"

    goto :goto_0

    .line 578
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_6

    const-string v0, "mouvement arr\u00eat\u00e9"

    goto :goto_0

    .line 579
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

    .line 580
    :cond_7
    const-string v0, "animation active"

    goto :goto_0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 408
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

    .line 409
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 410
    const-string v0, "Lecture arr\u00eat\u00e9e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucune lecture en cours"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 408
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private recordReturn(Ljava/lang/String;)V
    .locals 8

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 159
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    iget v3, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "t="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ms "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 160
    const-string v5, " ; affich\u00e9="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v0, "-:--"

    :goto_0
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; \u00e9tat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 159
    aput-object v0, v2, v3

    .line 161
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    .line 162
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    .line 163
    :cond_0
    return-void

    .line 160
    :cond_1
    double-to-long v0, v0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private renderButtons()V
    .locals 4

    .prologue
    .line 378
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_1

    .line 383
    :cond_0
    :goto_0
    return-void

    .line 379
    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_3

    const v1, 0x7f080121

    move v3, v1

    .line 380
    :goto_1
    const v1, 0x7f090238

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f09023e

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 381
    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 382
    :cond_2
    instance-of v0, v2, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, v2

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 379
    :cond_3
    const v1, 0x7f080122

    move v3, v1

    goto :goto_1
.end method

.method private renderProgress()V
    .locals 12

    .prologue
    .line 282
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 304
    :cond_0
    :goto_0
    return-void

    .line 283
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 284
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 285
    const v1, 0x7f09024a

    const-string v2, "-:--"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    const-string v2, "-:--"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 286
    const v1, 0x7f09024d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v1, 0x7f09023d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 287
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 288
    if-nez v0, :cond_2

    const/4 v1, 0x0

    .line 289
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

    .line 290
    check-cast v1, Landroid/widget/TextView;

    const-string v0, "Temps restant : \u2014"

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 288
    :cond_2
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 293
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-long v4, v4

    const-wide/16 v6, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v8, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 294
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

    .line 295
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

    .line 296
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

    .line 297
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

    .line 298
    const v2, 0x7f09024d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v2, 0x7f09023d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 299
    const v1, 0x7f09024a

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 300
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 301
    if-nez v0, :cond_7

    const/4 v1, 0x0

    .line 302
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

    .line 303
    check-cast v1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 301
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

    .line 597
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 598
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

    .line 599
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 602
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 603
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_4

    const-string v0, "\u2014"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 604
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 605
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_5

    const-string v0, "\u2014"

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 607
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_6

    const-string v0, "\u2014"

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 608
    const-string v0, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 609
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_7

    const-string v0, "\u2014"

    :goto_4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 610
    const-string v1, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    const-string v0, "\nSource position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    const-string v0, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_8

    const-string v0, "oui"

    :goto_5
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 614
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    const-string v0, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_9

    const-string v0, "oui"

    :goto_6
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    const-string v0, " ; \u00e2ge de la mesure : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_a

    const-string v0, "\u2014"

    :goto_7
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 618
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 619
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    const-string v0, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_b

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    :goto_8
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {p0, v0, v1, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    const-string v0, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    const-string v0, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 623
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v0, :cond_0

    const-string v0, "\nLik\u00e9s : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 624
    const-string v1, " ; rendu natif : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_c

    const-string v0, "non observ\u00e9"

    :goto_9
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    :cond_0
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 626
    const-string v0, " ; waiting-bridge avec lignes : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_d

    const-string v0, "ind\u00e9termin\u00e9"

    :goto_a
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    const-string v0, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 628
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v0, :cond_1

    const-string v0, " aucun"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    move v0, v2

    .line 629
    :goto_b
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-lt v0, v1, :cond_10

    .line 641
    const-string v0, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    const-string v0, "\nIntervalles position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v0, :cond_2

    const-string v0, "\u2014"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    move v0, v2

    .line 644
    :goto_c
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-lt v0, v1, :cond_12

    .line 649
    const-string v0, "\nRetour \u2014 absence : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_14

    const-string v0, "inconnue"

    :goto_d
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    const-string v0, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    const-string v0, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v0, v2

    .line 652
    :goto_e
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    if-lt v0, v1, :cond_15

    .line 656
    const-string v0, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v0, v2

    .line 657
    :goto_f
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    if-lt v0, v1, :cond_16

    .line 658
    const-string v0, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 659
    :goto_10
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-lt v2, v0, :cond_17

    .line 663
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 598
    :cond_3
    const-string v0, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    goto/16 :goto_0

    .line 603
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

    .line 605
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

    .line 607
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

    .line 609
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

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

    goto/16 :goto_4

    .line 613
    :cond_8
    const-string v0, "non"

    goto/16 :goto_5

    .line 615
    :cond_9
    const-string v0, "non"

    goto/16 :goto_6

    .line 617
    :cond_a
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

    goto/16 :goto_7

    .line 620
    :cond_b
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto/16 :goto_8

    .line 624
    :cond_c
    const-string v0, "lignes visibles"

    goto/16 :goto_9

    .line 626
    :cond_d
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v4, "waiting-bridge"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v0, :cond_f

    :cond_e
    const-string v0, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    goto/16 :goto_a

    :cond_f
    const-string v0, "non"

    goto/16 :goto_a

    .line 630
    :cond_10
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

    .line 631
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

    .line 632
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v6, v5, v1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    aget-wide v8, v5, v1

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 633
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

    .line 634
    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 635
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

    .line 636
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

    .line 637
    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    const-string v4, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 639
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v6, v5, v1

    cmp-long v5, v6, v10

    if-gez v5, :cond_11

    const-string v1, "\u2014"

    :goto_11
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 629
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_b

    .line 639
    :cond_11
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

    goto :goto_11

    .line 645
    :cond_12
    if-lez v0, :cond_13

    const-string v1, ", "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    :cond_13
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

    .line 647
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v4, v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " ms"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_c

    .line 649
    :cond_14
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_d

    .line 653
    :cond_15
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    sub-int/2addr v1, v4

    add-int/2addr v1, v0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v4, v4

    add-int/2addr v1, v4

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v4, v4

    rem-int/2addr v1, v4

    .line 654
    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v1, v5, v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_e

    .line 657
    :cond_16
    const-string v1, "\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_f

    .line 660
    :cond_17
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

    .line 661
    const-string v1, "\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v0, v4, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 659
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_10
.end method

.method private saveInProcess()V
    .locals 2

    .prologue
    .line 254
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 255
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 256
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 257
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    .line 258
    return-void
.end method

.method private scheduleFrame()V
    .locals 2

    .prologue
    .line 389
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

    .line 390
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 4

    .prologue
    .line 323
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 324
    :cond_0
    return-void
.end method

.method private seekDiagFinish(Ljava/lang/String;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 57
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

    .line 58
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-object p1, v0, v1

    .line 59
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 3

    .prologue
    const/16 v2, 0x3e8

    .line 306
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 307
    instance-of v1, v0, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 308
    check-cast v0, Landroid/widget/ProgressBar;

    .line 309
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 310
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v1

    if-eq v1, p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 312
    :cond_1
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 345
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v2, v0, p1

    .line 346
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

    .line 347
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

    .line 349
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 350
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v1, v5, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    .line 351
    :goto_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v6

    .line 352
    if-eqz v0, :cond_1

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v5, :cond_1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    if-eqz v1, :cond_1

    .line 353
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

    .line 352
    cmpg-double v1, v6, v8

    if-gez v1, :cond_1

    .line 354
    :goto_1
    new-array v5, v10, [I

    fill-array-data v5, :array_0

    .line 355
    :goto_2
    array-length v1, v5

    if-lt v2, v1, :cond_2

    .line 376
    return-void

    :cond_0
    move v1, v3

    .line 350
    goto :goto_0

    :cond_1
    move v3, v2

    .line 352
    goto :goto_1

    .line 356
    :cond_2
    if-nez v0, :cond_4

    move-object v1, v4

    .line 358
    :goto_3
    if-eqz v3, :cond_7

    instance-of v6, v1, Landroid/widget/ProgressBar;

    if-eqz v6, :cond_7

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 359
    check-cast v1, Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 360
    instance-of v6, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v6, :cond_7

    .line 361
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 362
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    const v6, 0x102000d

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 365
    :goto_4
    if-nez v1, :cond_5

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 355
    :cond_3
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 356
    :cond_4
    aget v1, v5, v2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_3

    .line 366
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

    .line 367
    :cond_6
    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 368
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v1, v6, v2

    .line 369
    const-string v6, "alpha"

    new-array v7, v10, [I

    fill-array-data v7, :array_1

    invoke-static {v1, v6, v7}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 370
    const-wide/16 v6, 0x640

    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 371
    invoke-virtual {v1, v10}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 372
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 373
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v6, v2

    .line 374
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_5

    :cond_7
    move-object v1, v4

    goto :goto_4

    .line 354
    nop

    :array_0
    .array-data 4
        0x7f09024d
        0x7f09023d
    .end array-data

    .line 369
    :array_1
    .array-data 4
        0x96
        0xff
    .end array-data
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 278
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 279
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

    .line 280
    :cond_0
    return-void
.end method


# virtual methods
.method public activityCreated()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 205
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 215
    :cond_0
    :goto_0
    return-void

    .line 206
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 209
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 211
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 212
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

    .line 213
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public activityPaused()V
    .locals 2

    .prologue
    .line 314
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 316
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 317
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    .line 318
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 319
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "onResume ; absence="

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    cmp-long v0, v2, v4

    if-gez v0, :cond_1

    const-string v0, "inconnue"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 321
    return-void

    .line 317
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    sub-long v0, v2, v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_0

    .line 320
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " ms"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public activityStarted()V
    .locals 1

    .prologue
    .line 313
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 343
    const-string v0, "onStop"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 566
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 569
    return-void
.end method

.method public attachSeek(Landroid/webkit/WebView;)V
    .locals 2

    .prologue
    .line 61
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 62
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    const/4 v1, 0x0

    .line 63
    :goto_0
    instance-of v0, v1, Landroid/widget/SeekBar;

    if-eqz v0, :cond_0

    move-object v0, v1

    .line 64
    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 65
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 67
    :cond_0
    return-void

    .line 62
    :cond_1
    const v1, 0x7f09023d

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_0
.end method

.method public begin(I)V
    .locals 2

    .prologue
    .line 561
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 562
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 563
    return-void
.end method

.method public command()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 564
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

    .line 392
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 393
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 406
    :cond_0
    :goto_0
    return-void

    .line 394
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 395
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    if-eqz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 396
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 397
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v0

    if-gtz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v2, v0, v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 399
    :cond_2
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 400
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 402
    :cond_3
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 403
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    .line 404
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 405
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
    .line 180
    if-eqz p1, :cond_0

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 186
    :cond_0
    :goto_0
    return-void

    .line 181
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_3

    .line 182
    const-string v0, "waiting-bridge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 183
    :cond_2
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    goto :goto_0

    .line 185
    :cond_3
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 8

    .prologue
    .line 89
    if-eqz p3, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_1

    .line 92
    :cond_0
    :goto_0
    return-void

    .line 90
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

    .line 91
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .prologue
    const-wide/16 v2, 0x0

    .line 77
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 78
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    double-to-long v6, v0

    .line 79
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    .line 80
    const-string v0, "remplac\u00e9 par un nouveau geste"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 81
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 82
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

    .line 83
    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 85
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 87
    :cond_1
    return-void

    :cond_2
    move-wide v0, v2

    .line 82
    goto :goto_0
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .prologue
    .line 94
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 134
    :goto_0
    return-void

    .line 95
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    .line 96
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_0

    .line 97
    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 98
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 99
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    .line 100
    :cond_3
    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v0

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    .line 101
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aput-wide v6, v0, v4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aput-wide v2, v0, v4

    .line 102
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    const-wide/16 v10, -0x1

    aput-wide v10, v8, v4

    aput-wide v10, v5, v4

    aput-wide v10, v1, v4

    aput-wide v10, v0, v4

    .line 103
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    const-wide/16 v8, 0x0

    cmp-long v0, v0, v8

    if-gez v0, :cond_4

    const-wide/16 v0, -0x1

    :goto_1
    aput-wide v0, v5, v4

    .line 104
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    aput-wide v8, v0, v4

    .line 105
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v1, "en attente"

    aput-object v1, v0, v4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    const-string v1, "en attente"

    aput-object v1, v0, v4

    .line 106
    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    double-to-long v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 107
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v0

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 108
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 109
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "playing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 110
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 111
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 112
    if-eqz v0, :cond_5

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "window.__sfPreviewSeek&&window.__sfPreviewSeek("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 114
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

    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 115
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v10

    aput-wide v10, v2, v4

    .line 116
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v2, p0, v4, v6, v7}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 125
    :goto_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v1, p0, v8, v9}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 133
    const-wide/16 v2, 0x1388

    .line 125
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 103
    :cond_4
    const-wide/16 v0, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    sub-long v8, v2, v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto/16 :goto_1

    .line 124
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

    .line 69
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 70
    :cond_0
    return v2
.end method

.method public phase(Ljava/lang/String;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 192
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_0

    if-nez p1, :cond_1

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 194
    const-string v2, "rows-received"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    goto :goto_0

    .line 195
    :cond_2
    const-string v2, "liked-route-other"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v0, "page diff\u00e9rente"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 196
    :cond_3
    const-string v2, "liked-dom-empty"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v0, "page lik\u00e9s vue, aucune ligne DOM observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 197
    :cond_4
    const-string v2, "liked-dom-rows"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v0, "page lik\u00e9s vue, lignes DOM pr\u00e9sentes"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 198
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

    .line 199
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

    .line 200
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

    .line 201
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
    .locals 7

    .prologue
    const/4 v6, 0x0

    const-wide/16 v4, -0x1

    .line 217
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 218
    :cond_0
    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 219
    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 220
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 221
    if-eqz p1, :cond_2

    const-string v0, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 222
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 224
    :cond_2
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const-wide/16 v6, 0x0

    .line 226
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

    .line 227
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

    .line 229
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 230
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-lt v0, v2, :cond_2

    .line 240
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 241
    return-void

    .line 231
    :cond_2
    :try_start_1
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 232
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

    .line 233
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 234
    :cond_3
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 235
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_1

    .line 230
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x3e8

    const-wide/16 v8, 0x0

    .line 326
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 327
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 342
    :cond_0
    :goto_0
    return-void

    .line 328
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 329
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    cmp-long v0, v0, v8

    if-gez v0, :cond_2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 330
    :cond_2
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v0, v8

    if-gez v0, :cond_5

    const-string v0, "\u2014"

    .line 331
    :goto_1
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "+"

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    sub-long v6, v2, v6

    div-long/2addr v6, v10

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " s : identit\u00e9="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 332
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v1, :cond_6

    const-string v1, "oui"

    :goto_2
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, ", \u00e9tat="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 333
    const-string v6, ", mesure="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    .line 331
    aput-object v0, v4, v5

    .line 334
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    cmp-long v0, v0, v8

    if-ltz v0, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v0, v2, v0

    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    mul-long/2addr v4, v10

    cmp-long v0, v0, v4

    if-ltz v0, :cond_3

    .line 335
    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 336
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "t="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ms ; retour +"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long/2addr v2, v8

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ms ; affich\u00e9="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 337
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v0, "-:--"

    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; \u00e9tat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 336
    aput-object v0, v4, v5

    .line 339
    :cond_3
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 340
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_4

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 341
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    goto/16 :goto_0

    .line 330
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v4, v2, v4

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->max(JJ)J

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

    .line 332
    :cond_6
    const-string v1, "non"

    goto/16 :goto_2

    .line 337
    :cond_7
    double-to-long v0, v0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public showDiagnostics()V
    .locals 5

    .prologue
    .line 667
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 676
    :goto_0
    return-void

    .line 668
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 669
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 670
    const-string v3, "Copier"

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v4, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 675
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 32

    .prologue
    .line 414
    :try_start_0
    new-instance v18, Lorg/json/JSONObject;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 415
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v20

    .line 416
    const-string v4, "previewProgressValid"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 420
    const-string v4, "track"

    const-string v5, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "artist"

    const-string v6, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 421
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v6, :cond_1

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v6

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

    .line 422
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

    .line 423
    const-wide/16 v4, -0x1

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 425
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 542
    :cond_2
    :goto_0
    return-void

    .line 428
    :cond_3
    const-string v4, "track"

    const-string v5, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v4, "artist"

    const-string v5, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 429
    const-string v4, "previewTrackUri"

    const-string v5, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 430
    const-string v4, "previewPositionMs"

    const-wide/16 v6, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-string v4, "previewDurationMs"

    const-wide/16 v6, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v24

    .line 431
    const-string v5, "previewPlaybackState"

    const-string v4, "playing"

    const/4 v6, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_13

    const-string v4, "playing"

    :goto_1
    move-object/from16 v0, v18

    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 432
    const-string v5, "playing"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3a

    const-string v5, "paused"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3a

    const-string v4, "unknown"

    move-object/from16 v17, v4

    .line 433
    :goto_2
    const-string v4, "playing"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    .line 434
    const-string v4, "previewProgressValid"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_14

    const-wide/16 v4, 0x0

    cmp-long v4, v24, v4

    if-lez v4, :cond_14

    const-wide/16 v4, 0x0

    cmp-long v4, v10, v4

    if-ltz v4, :cond_14

    cmp-long v4, v10, v24

    if-gtz v4, :cond_14

    const/4 v4, 0x1

    move v6, v4

    .line 435
    :goto_3
    invoke-static/range {v19 .. v19}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-static/range {v22 .. v22}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15

    const-wide/16 v4, 0x0

    cmp-long v4, v24, v4

    if-lez v4, :cond_15

    const/4 v4, 0x1

    move/from16 v16, v4

    .line 436
    :goto_4
    if-eqz v16, :cond_16

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v4, :cond_4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 437
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v4, v4, v24

    if-eqz v4, :cond_16

    .line 436
    :cond_4
    const/4 v4, 0x1

    move v15, v4

    .line 438
    :goto_5
    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v8

    .line 439
    if-nez v15, :cond_17

    if-eqz v6, :cond_17

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v12, 0x0

    cmp-long v4, v4, v12

    if-ltz v4, :cond_17

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v12, 0x7d0

    sub-long/2addr v4, v12

    cmp-long v4, v10, v4

    if-gez v4, :cond_17

    const/4 v4, 0x1

    .line 440
    :goto_6
    if-eqz v6, :cond_5

    if-nez v15, :cond_5

    if-nez v4, :cond_5

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v12, 0x0

    cmp-long v4, v4, v12

    if-ltz v4, :cond_5

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v4, v10, v4

    if-eqz v4, :cond_5

    .line 441
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v4, :cond_18

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v4, :cond_18

    if-eqz v26, :cond_18

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_18

    if-nez v15, :cond_18

    const/4 v4, 0x1

    move v14, v4

    .line 442
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move/from16 v27, v0

    .line 443
    const-string v4, "previewProgressSource"

    const-string v5, "none"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 444
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "range"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "media"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "clock"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "none"

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 447
    :cond_6
    const-string v4, "previewObservedAtMs"

    const-wide/16 v12, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 448
    const-wide/16 v12, 0x0

    cmp-long v7, v4, v12

    if-gez v7, :cond_19

    const-wide/16 v4, -0x1

    move-wide v12, v4

    .line 449
    :goto_8
    if-nez v6, :cond_1a

    const-string v4, "invalide"

    move-object v7, v4

    .line 454
    :goto_9
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    .line 456
    if-eqz v6, :cond_1f

    if-nez v15, :cond_7

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v28, 0x0

    cmp-long v4, v4, v28

    if-ltz v4, :cond_7

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v4, v10, v4

    if-eqz v4, :cond_1f

    :cond_7
    const/4 v5, 0x1

    .line 457
    :goto_a
    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 458
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v28, "mesure="

    move-object/from16 v0, v28

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v28, " ms ; \u00e2ge observation="

    move-object/from16 v0, v28

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-wide/16 v30, 0x0

    cmp-long v4, v12, v30

    if-gez v4, :cond_20

    const-string v4, "inconnu"

    :goto_b
    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 459
    const-string v12, " ; source="

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v12, " ; "

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    if-eqz v6, :cond_21

    const-string v4, "accept\u00e9e"

    :goto_c
    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 458
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 460
    if-eqz v15, :cond_8

    .line 461
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v8, -0x1

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 462
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/high16 v8, 0x7ff8000000000000L    # Double.NaN

    .line 463
    const-wide/16 v12, -0x1

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    :cond_8
    move-wide v12, v8

    .line 465
    if-eqz v16, :cond_9

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 466
    :cond_9
    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_a

    if-eqz v15, :cond_b

    :cond_a
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 469
    :cond_b
    const-string v4, "previewConfirmPositionMs"

    const-wide/16 v8, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 470
    if-eqz v16, :cond_d

    const-wide/16 v18, 0x0

    cmp-long v4, v8, v18

    if-ltz v4, :cond_d

    cmp-long v4, v8, v24

    if-gtz v4, :cond_d

    .line 471
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v4, :cond_c

    if-nez v15, :cond_c

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v4, :cond_c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aget-wide v18, v4, v18

    const-wide/16 v28, 0x0

    cmp-long v4, v18, v28

    if-ltz v4, :cond_c

    .line 472
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aget-wide v18, v4, v18

    const-wide/16 v28, 0x0

    cmp-long v4, v18, v28

    if-gez v4, :cond_c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aget-wide v18, v4, v18

    cmp-long v4, v8, v18

    if-eqz v4, :cond_c

    .line 473
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aput-wide v20, v4, v18

    .line 474
    :cond_c
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 476
    :cond_d
    const/4 v4, 0x0

    .line 477
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move/from16 v18, v0

    if-eqz v18, :cond_39

    if-nez v15, :cond_39

    .line 479
    if-eqz v26, :cond_22

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v10, v20, v10

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 480
    :goto_d
    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v4, v10

    move-wide/from16 v0, v24

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 481
    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-ltz v6, :cond_e

    cmp-long v6, v8, v24

    if-gtz v6, :cond_e

    .line 482
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 484
    :cond_e
    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-ltz v6, :cond_f

    sub-long v4, v8, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/16 v10, 0x9c4

    cmp-long v4, v4, v10

    if-lez v4, :cond_23

    .line 485
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v4, :cond_10

    if-nez v26, :cond_10

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 486
    :cond_10
    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 487
    const-string v4, "unknown"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_11

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_11

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 488
    :cond_11
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 538
    :catch_0
    move-exception v4

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    .line 539
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v6, :cond_12

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-nez v6, :cond_12

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 540
    :cond_12
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v4, "mesure rejet\u00e9e : format invalide"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    goto/16 :goto_0

    .line 431
    :cond_13
    :try_start_1
    const-string v4, "paused"

    goto/16 :goto_1

    .line 434
    :cond_14
    const/4 v4, 0x0

    move v6, v4

    goto/16 :goto_3

    .line 435
    :cond_15
    const/4 v4, 0x0

    move/from16 v16, v4

    goto/16 :goto_4

    .line 436
    :cond_16
    const/4 v4, 0x0

    move v15, v4

    goto/16 :goto_5

    .line 439
    :cond_17
    const/4 v4, 0x0

    goto/16 :goto_6

    .line 441
    :cond_18
    const/4 v4, 0x0

    move v14, v4

    goto/16 :goto_7

    .line 448
    :cond_19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v4, v12, v4

    move-wide v12, v4

    goto/16 :goto_8

    .line 449
    :cond_1a
    const-wide/16 v4, 0x0

    cmp-long v4, v12, v4

    if-gez v4, :cond_1b

    const-string v4, "\u00e2ge inconnu"

    move-object v7, v4

    goto/16 :goto_9

    .line 450
    :cond_1b
    const-wide/16 v4, 0xbb8

    cmp-long v4, v12, v4

    if-ltz v4, :cond_1c

    const-string v4, "observation ancienne"

    move-object v7, v4

    goto/16 :goto_9

    .line 451
    :cond_1c
    if-nez v16, :cond_1d

    const-string v4, "identit\u00e9 incompl\u00e8te"

    move-object v7, v4

    goto/16 :goto_9

    .line 452
    :cond_1d
    if-nez v15, :cond_1e

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_1e

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v4, :cond_1e

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_1e

    .line 453
    long-to-double v4, v10

    sub-double/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x40b3880000000000L    # 5000.0

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_1e

    const-string v4, "\u00e9cart >= 5 s"

    move-object v7, v4

    goto/16 :goto_9

    :cond_1e
    const-string v4, ""

    move-object v7, v4

    goto/16 :goto_9

    .line 456
    :cond_1f
    const/4 v5, 0x0

    goto/16 :goto_a

    .line 458
    :cond_20
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " ms"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_b

    .line 459
    :cond_21
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v13, "rejet\u00e9e : "

    invoke-direct {v4, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_c

    .line 479
    :cond_22
    const-wide/16 v4, 0x0

    goto/16 :goto_d

    .line 492
    :cond_23
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v4, :cond_24

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v20, v4, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v6, "position UI proche de la cible"

    aput-object v6, v4, v5

    .line 493
    :cond_24
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v10, 0x1

    add-long/2addr v4, v10

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const/4 v4, 0x1

    .line 494
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    .line 495
    const-wide/16 v10, -0x1

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move v5, v6

    move v7, v6

    .line 497
    :goto_e
    if-eqz v7, :cond_34

    .line 498
    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 499
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v6, :cond_25

    if-nez v15, :cond_25

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 500
    :cond_25
    long-to-double v6, v8

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 510
    :cond_26
    :goto_f
    if-eqz v5, :cond_28

    .line 511
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_27

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_27

    if-eqz v26, :cond_27

    .line 512
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v6, v20, v6

    aput-wide v6, v4, v5

    .line 513
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    rem-int/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 514
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    if-ge v4, v5, :cond_27

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 516
    :cond_27
    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 518
    :cond_28
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 519
    if-eqz v16, :cond_33

    if-eqz v26, :cond_33

    if-nez v14, :cond_33

    const/4 v4, 0x1

    :goto_10
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 524
    :goto_11
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 525
    const-string v4, "unknown"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2a

    .line 526
    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 527
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v4, :cond_29

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v26

    if-ne v0, v4, :cond_29

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 528
    :cond_29
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_2a

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 530
    :cond_2a
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 531
    const-string v4, "apr\u00e8s mesure"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 532
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

    .line 533
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2b

    const-string v4, "unknown"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2b

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v26

    if-eq v0, v4, :cond_2c

    .line 534
    :cond_2b
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 535
    :cond_2c
    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    goto/16 :goto_0

    .line 501
    :cond_2d
    if-eqz v4, :cond_2e

    if-nez v26, :cond_2e

    .line 502
    const-wide/16 v6, 0x0

    move-wide/from16 v0, v24

    long-to-double v10, v0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v6, v8

    sub-double/2addr v6, v12

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_f

    .line 503
    :cond_2e
    if-eqz v5, :cond_2f

    if-nez v26, :cond_2f

    if-nez v14, :cond_2f

    .line 504
    const-wide/16 v6, 0x0

    move-wide/from16 v0, v24

    long-to-double v10, v0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_f

    .line 505
    :cond_2f
    if-eqz v5, :cond_30

    if-nez v14, :cond_30

    .line 506
    const-wide/16 v6, 0x0

    move-wide/from16 v0, v24

    long-to-double v10, v0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v6, v8

    sub-double/2addr v6, v12

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_f

    .line 507
    :cond_30
    if-eqz v27, :cond_31

    if-eqz v26, :cond_32

    if-nez v14, :cond_32

    :cond_31
    if-nez v27, :cond_26

    if-eqz v26, :cond_26

    .line 508
    :cond_32
    const-wide/16 v6, 0x0

    move-wide/from16 v0, v24

    long-to-double v10, v0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_f

    .line 519
    :cond_33
    const/4 v4, 0x0

    goto/16 :goto_10

    .line 520
    :cond_34
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_38

    if-nez v15, :cond_38

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_38

    .line 521
    if-eqz v26, :cond_35

    if-eqz v14, :cond_36

    :cond_35
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 522
    :cond_36
    if-eqz v26, :cond_37

    if-nez v14, :cond_37

    const/4 v4, 0x1

    :goto_12
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto/16 :goto_11

    :cond_37
    const/4 v4, 0x0

    goto :goto_12

    .line 523
    :cond_38
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_11

    :cond_39
    move v7, v6

    move-wide v8, v10

    goto/16 :goto_e

    :cond_3a
    move-object/from16 v17, v4

    goto/16 :goto_2
.end method

.method public tapPlayPause()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 544
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 545
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const/4 v2, -0x1

    .line 558
    :cond_0
    :goto_0
    return v2

    .line 546
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    .line 547
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

    .line 548
    :cond_2
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 549
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 550
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 551
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v3, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 557
    const-wide/16 v4, 0x1f40

    .line 551
    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 558
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_3
    move v0, v2

    .line 548
    goto :goto_1
.end method
