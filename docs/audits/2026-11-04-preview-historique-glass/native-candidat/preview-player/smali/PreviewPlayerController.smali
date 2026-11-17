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

.field static final HOLD_DISPLAY_MS:J = 0x1770L

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

.field private static savedFrozenPosition:D

.field private static savedIdentity:Z

.field private static savedInterrupted:Z

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
            "Ljava/lang/ref/WeakReference<",
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

.field private divergentCount:I

.field private divergentLastAt:J

.field private divergentSign:I

.field private divergentSince:J

.field private divergentSource:Ljava/lang/String;

.field private dragging:Z

.field private duration:J

.field private durationText:Ljava/lang/String;

.field private elapsedText:Ljava/lang/String;

.field private foreground:Z

.field private frameAt:J

.field private frameScheduled:Z

.field private frozenPosition:D

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

.field private interrupted:Z

.field private intervalCount:I

.field private intervalIndex:I

.field private final intervals:[J

.field private lastShownAt:J

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

.field private resyncing:Z

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
            "Ljava/lang/ref/WeakReference<",
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
    .locals 3

    .line 160
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    .line 161
    const-string v2, ""

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    const-string v2, "unknown"

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    .line 180
    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 6

    .line 248
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
    const/16 v0, 0x8

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    .line 53
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 55
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    .line 136
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 137
    const-string v2, "\u2014"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v3, "Temps restant : \u2014"

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 139
    const-string v3, ""

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 140
    const-string v4, "none"

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 144
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v5, "unknown"

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 145
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 146
    const/16 v5, 0x78

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 148
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 149
    const/16 v5, 0x14

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    const/16 v5, 0xa

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    .line 151
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    .line 154
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    .line 156
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 171
    const/4 v4, 0x2

    new-array v5, v4, [Landroid/animation/ObjectAnimator;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 172
    new-array v4, v4, [Landroid/graphics/drawable/Drawable;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 174
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 175
    const/16 v4, 0x3c

    new-array v4, v4, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 178
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 182
    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 193
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 194
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 195
    const-string v2, "non observ\u00e9e"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 208
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 293
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 249
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 250
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz p1, :cond_0

    .line 251
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 252
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 253
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 254
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 255
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 256
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 257
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 259
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    return-object p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    return-object p0
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 32
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    return-wide v0
.end method

.method static synthetic access$1202(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 32
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    return-wide p1
.end method

.method static synthetic access$1302(Lcom/melodix/music/PreviewPlayerController;D)D
    .locals 0

    .line 32
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    return-wide p1
.end method

.method static synthetic access$1402(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 32
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return p0
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method static synthetic access$1700(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 32
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return p0
.end method

.method static synthetic access$1902(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return p1
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$2000(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 32
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$2102(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return p1
.end method

.method static synthetic access$2200(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 32
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return p0
.end method

.method static synthetic access$2300(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method static synthetic access$2400(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    return-void
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 32
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return p0
.end method

.method static synthetic access$402(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return p1
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 32
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$702(Lcom/melodix/music/PreviewPlayerController;D)D
    .locals 0

    .line 32
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    return-wide p1
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 32
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-wide v0
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 32
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    return-wide v0
.end method

.method private cancelSeek()V
    .locals 4

    .line 73
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    const-string v0, "annul\u00e9 (identit\u00e9 chang\u00e9e ou invalide)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 74
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 75
    return-void
.end method

.method private static clock(J)Ljava/lang/String;
    .locals 8

    .line 283
    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    const-wide/16 v2, 0x3c

    rem-long v4, p0, v2

    div-long v6, p0, v2

    rem-long/2addr v6, v2

    const-wide/16 v2, 0xe10

    div-long/2addr p0, v2

    .line 284
    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {p0, p1, v1}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d:%02d:%02d"

    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%d:%02d"

    invoke-static {p0, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private correctionInProgress(J)Z
    .locals 6

    .line 421
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v0, v0

    const-wide/high16 v4, 0x3ff4000000000000L    # 1.25

    :goto_0
    mul-double/2addr v0, v4

    const-wide v4, 0x40af400000000000L    # 4000.0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    .line 422
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    cmpl-double v2, v4, v2

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr p1, v2

    long-to-double p1, p1

    cmpg-double p1, p1, v0

    if-gez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method private delta(J)Ljava/lang/String;
    .locals 4

    .line 659
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v2, v0

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    sub-long/2addr p1, v1

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " ms"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    :goto_0
    const-string p1, "\u2014"

    :goto_1
    return-object p1
.end method

.method private dominantPhase()Ljava/lang/String;
    .locals 18

    .line 677
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iget-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v1, v1, v5

    if-gtz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_0

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_5

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iget-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v1, v1, v5

    if-lez v1, :cond_0

    goto/16 :goto_3

    .line 679
    :cond_0
    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iget-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long/2addr v1, v5

    iget-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v5, v5, v3

    if-ltz v5, :cond_1

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    sub-long/2addr v8, v10

    goto :goto_0

    :cond_1
    const-wide/16 v8, -0x1

    :goto_0
    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    .line 680
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v5, v12, v3

    if-ltz v5, :cond_2

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    goto :goto_1

    :cond_2
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    :goto_1
    sub-long/2addr v10, v12

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    sub-long/2addr v12, v14

    iget-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    sub-long/2addr v14, v6

    const/4 v5, 0x5

    new-array v6, v5, [J

    const/4 v7, 0x0

    aput-wide v1, v6, v7

    const/4 v1, 0x1

    aput-wide v8, v6, v1

    const/4 v2, 0x2

    aput-wide v10, v6, v2

    const/4 v8, 0x3

    aput-wide v12, v6, v8

    const/4 v9, 0x4

    aput-wide v14, v6, v9

    .line 681
    new-array v10, v5, [Ljava/lang/String;

    const-string v11, "attente pont"

    aput-object v11, v10, v7

    const-string v11, "navigation \u2192 page pr\u00eate"

    aput-object v11, v10, v1

    const-string v1, "page/pont \u2192 lignes re\u00e7ues"

    aput-object v1, v10, v2

    const-string v1, "r\u00e9ception \u2192 rendu natif"

    aput-object v1, v10, v8

    const-string v1, "rendu \u2192 frame"

    aput-object v1, v10, v9

    .line 682
    nop

    .line 683
    const-string v1, "ind\u00e9termin\u00e9e"

    const-wide/16 v16, -0x1

    :goto_2
    if-ge v7, v5, :cond_4

    aget-wide v8, v6, v7

    cmp-long v2, v8, v3

    if-ltz v2, :cond_3

    aget-wide v8, v6, v7

    cmp-long v2, v8, v16

    if-lez v2, :cond_3

    aget-wide v1, v6, v7

    aget-object v8, v10, v7

    move-wide/from16 v16, v1

    move-object v1, v8

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 684
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (phases observ\u00e9es uniquement)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 678
    :cond_5
    :goto_3
    const-string v1, "ind\u00e9termin\u00e9e (phases manquantes ou non s\u00e9quentielles)"

    return-object v1
.end method

.method private freezeForBackground(Ljava/lang/String;)V
    .locals 7

    .line 331
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 332
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 333
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v3

    .line 334
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-nez v5, :cond_0

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 335
    :cond_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    .line 336
    const-string v1, "interrupted"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v0, v5

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 337
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ; avant="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ; apr\u00e8s=interrupted ; fig\u00e9e="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 339
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "-:--"

    goto :goto_0

    :cond_1
    double-to-long v0, v3

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ; signal audio natif=non lu (incertain)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 338
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 340
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 341
    return-void
.end method

.method private now()J
    .locals 2

    .line 267
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 2

    .line 673
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    cmp-long v0, p3, p1

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sub-long/2addr p3, p1

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " ms"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    :goto_0
    const-string p1, "\u2014"

    :goto_1
    return-object p1
.end method

.method private position(J)D
    .locals 1

    .line 269
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double p1, p1

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide p1

    :goto_0
    return-wide p1
.end method

.method private positionUnderlying(J)D
    .locals 8

    .line 272
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_0

    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1

    .line 273
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_1

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    return-wide p1

    .line 274
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 275
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_2

    move-wide v0, p1

    .line 278
    :cond_2
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_3

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    goto :goto_0

    :cond_3
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v2, v2

    const-wide/high16 v6, 0x3ff4000000000000L    # 1.25

    :goto_0
    mul-double/2addr v2, v6

    const-wide v6, 0x40af400000000000L    # 4000.0

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 279
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    long-to-double p1, p1

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    mul-double/2addr v6, p1

    .line 280
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double p1, p1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    long-to-double v0, v0

    add-double/2addr v2, v0

    add-double/2addr v2, v6

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide p1

    return-wide p1
.end method

.method private progressStopReason()Ljava/lang/String;
    .locals 4

    .line 661
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const-string v0, "lecture interrompue au d\u00e9part ; audio non v\u00e9rifi\u00e9"

    return-object v0

    .line 662
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const-string v0, "\u00e9tat du lecteur indisponible"

    return-object v0

    .line 663
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_2

    const-string v0, "pause demand\u00e9e"

    return-object v0

    .line 664
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    return-object v0

    .line 665
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "lecture en pause"

    return-object v0

    .line 666
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_5

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    return-object v0

    .line 667
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_6

    const-string v0, "position ou dur\u00e9e indisponible"

    return-object v0

    .line 668
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_7

    const-string v0, "mouvement arr\u00eat\u00e9"

    return-object v0

    .line 669
    :cond_7
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v2, v2

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_8

    const-string v0, "fin du titre"

    return-object v0

    .line 670
    :cond_8
    const-string v0, "animation active"

    return-object v0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .line 444
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

    .line 445
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 446
    const-string v0, "Lecture arr\u00eat\u00e9e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucune lecture en cours"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 444
    :goto_0
    return p0
.end method

.method private recordReturn(Ljava/lang/String;)V
    .locals 7

    .line 163
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 164
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    iget v3, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "t="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ms "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v4, " ; affich\u00e9="

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 165
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v0, "-:--"

    goto :goto_0

    :cond_0
    double-to-long v0, v0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ; \u00e9tat natif="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    .line 166
    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    add-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v0, v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    .line 167
    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_1

    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    .line 168
    :cond_1
    return-void
.end method

.method private renderButtons()V
    .locals 5

    .line 410
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_8

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_0

    goto :goto_2

    .line 413
    :cond_0
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    const v2, 0x7f080121

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    if-eqz v1, :cond_2

    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    const v1, 0x7f080122

    .line 414
    :goto_0
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v3, :cond_4

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eqz v2, :cond_3

    const-string v2, "Lecture demand\u00e9e, en attente"

    goto :goto_1

    :cond_3
    const-string v2, "Pause demand\u00e9e, en attente"

    goto :goto_1

    .line 415
    :cond_4
    if-ne v1, v2, :cond_5

    const-string v2, "Mettre en pause"

    goto :goto_1

    :cond_5
    const-string v2, "Lire"

    .line 416
    :goto_1
    const v3, 0x7f090238

    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f09023e

    invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 417
    instance-of v4, v3, Landroid/widget/ImageView;

    if-eqz v4, :cond_6

    move-object v4, v3

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v3, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 418
    :cond_6
    instance-of v3, v0, Landroid/widget/ImageView;

    if-eqz v3, :cond_7

    move-object v3, v0

    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 419
    :cond_7
    return-void

    .line 410
    :cond_8
    :goto_2
    return-void
.end method

.method private renderProgress()V
    .locals 17

    .line 295
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return-void

    .line 296
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 297
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    const-wide/16 v5, 0x0

    if-eqz v4, :cond_1

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    cmp-long v4, v7, v5

    if-ltz v4, :cond_1

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v7

    iget-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    sub-long/2addr v7, v9

    const-wide/16 v9, 0x1770

    cmp-long v4, v7, v9

    if-gez v4, :cond_1

    return-void

    .line 298
    :cond_1
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    const-string v8, "nativePlayerRemaining"

    const v9, 0x7f09023a

    const v10, 0x7f09023d

    const v11, 0x7f09024d

    const v12, 0x7f09024b

    const v13, 0x7f09024a

    if-eqz v4, :cond_4

    .line 299
    const-string v2, "-:--"

    invoke-direct {v0, v1, v13, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    invoke-direct {v0, v1, v12, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 300
    const/4 v2, 0x0

    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    invoke-direct {v0, v1, v10, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 301
    invoke-virtual {v1, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 302
    if-nez v1, :cond_2

    const/4 v7, 0x0

    goto :goto_0

    :cond_2
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 303
    :goto_0
    instance-of v1, v7, Landroid/widget/TextView;

    if-eqz v1, :cond_3

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "Temps restant : \u2014"

    invoke-virtual {v2, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 304
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    :cond_3
    return-void

    .line 307
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 308
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    double-to-long v14, v14

    move-object/from16 v16, v8

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v7, v14

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 309
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v9, 0x3e8

    div-long v4, v14, v9

    cmp-long v12, v12, v4

    if-eqz v12, :cond_5

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v14, v15}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 310
    :cond_5
    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    div-long/2addr v12, v9

    cmp-long v4, v4, v12

    if-eqz v4, :cond_6

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    div-long/2addr v4, v9

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    .line 311
    :cond_6
    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    div-long v12, v7, v9

    cmp-long v4, v4, v12

    if-eqz v4, :cond_7

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Temps restant : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v7, v8}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 312
    :cond_7
    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v4, v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 313
    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v3, 0x7f09023d

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 314
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const v3, 0x7f09024a

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const v3, 0x7f09024b

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 315
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 316
    if-nez v1, :cond_8

    const/4 v7, 0x0

    goto :goto_1

    :cond_8
    move-object/from16 v2, v16

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 317
    :goto_1
    instance-of v1, v7, Landroid/widget/TextView;

    if-eqz v1, :cond_9

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 318
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    :cond_9
    return-void
.end method

.method private report()Ljava/lang/String;
    .locals 16

    .line 687
    move-object/from16 v0, p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 688
    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    const-string v2, "Appui : \u2014\nCommande re\u00e7ue du pont : "

    goto :goto_0

    :cond_0
    const-string v2, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    const-string v2, "\nInterface optimiste : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 690
    const-string v2, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 691
    const-string v2, "\nInterface confirm\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 692
    const-string v2, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 693
    sget-wide v6, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v3, v6, v4

    const-string v6, "\u2014"

    const-string v7, " ms"

    if-gez v3, :cond_1

    move-object v3, v6

    goto :goto_1

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    const-string v2, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 695
    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_2

    move-object v3, v6

    goto :goto_2

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    const-string v2, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 697
    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_3

    move-object v3, v6

    goto :goto_3

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    const-string v2, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 699
    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_4

    move-object v3, v6

    goto :goto_4

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 700
    const-string v3, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 701
    const-string v2, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 702
    const-string v2, "\nSource position : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    const-string v2, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    const-string v8, "oui"

    const-string v9, "non"

    if-eqz v3, :cond_5

    move-object v3, v8

    goto :goto_5

    :cond_5
    move-object v3, v9

    :goto_5
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 704
    const-string v2, "\nAnimation barre : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 705
    const-string v2, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_6

    goto :goto_6

    :cond_6
    move-object v8, v9

    :goto_6
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 706
    const-string v2, " ; \u00e9tat : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 707
    const-string v2, " ; \u00e2ge de la mesure : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v3, v10, v4

    if-gez v3, :cond_7

    move-object v3, v6

    goto :goto_7

    :cond_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v10

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long/2addr v10, v12

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_7
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 708
    const-string v2, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 709
    const-string v2, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    const-string v2, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v3, v10, v4

    if-ltz v3, :cond_8

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    goto :goto_8

    :cond_8
    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    :goto_8
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 711
    const-string v2, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 712
    const-string v2, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 713
    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v2, :cond_a

    const-string v2, "\nLik\u00e9s : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 714
    const-string v3, " ; rendu natif : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v3, v10, v4

    if-gez v3, :cond_9

    const-string v3, "non observ\u00e9"

    goto :goto_9

    :cond_9
    const-string v3, "lignes visibles"

    :goto_9
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 715
    :cond_a
    const-string v2, "\nPhase dominante : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 716
    const-string v2, " ; waiting-bridge avec lignes : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v3, v10, v4

    if-gez v3, :cond_b

    const-string v9, "ind\u00e9termin\u00e9"

    goto :goto_a

    :cond_b
    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v8, "waiting-bridge"

    invoke-virtual {v3, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c

    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v3, :cond_d

    :cond_c
    const-string v9, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    :cond_d
    :goto_a
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 717
    const-string v2, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 718
    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v2, :cond_e

    const-string v2, " aucun"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 719
    :cond_e
    const/4 v3, 0x0

    :goto_b
    iget v8, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-ge v3, v8, :cond_10

    .line 720
    iget v8, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    sub-int/2addr v8, v9

    add-int/lit8 v8, v8, 0x1

    add-int/2addr v8, v3

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v9, v9

    add-int/2addr v8, v9

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v9, v9

    rem-int/2addr v8, v9

    .line 721
    const-string v9, "\n#"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aget-wide v11, v10, v8

    invoke-virtual {v9, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " rel\u00e2chement : 0 ms ; envoi WebView : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v11, v10, v8

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    aget-wide v13, v10, v8

    .line 722
    invoke-direct {v0, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 723
    const-string v9, " ; fin JS : "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v11, v10, v8

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    aget-wide v13, v10, v8

    invoke-direct {v0, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 724
    const-string v10, " ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v11, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v11, v11, v8

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ")"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 725
    const-string v9, " ; premi\u00e8re position UI diff\u00e9rente : "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v13, v12, v8

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move v15, v3

    aget-wide v2, v12, v8

    invoke-direct {v0, v13, v14, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 726
    const-string v2, " ; position UI confirm\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v12, v3, v8

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    aget-wide v4, v3, v8

    invoke-direct {v0, v12, v13, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 727
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v3, v3, v8

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 728
    const-string v2, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 729
    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v4, v3, v8

    const-wide/16 v9, 0x0

    cmp-long v3, v4, v9

    if-gez v3, :cond_f

    move-object v3, v6

    goto :goto_c

    :cond_f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v8, v4, v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_c
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 719
    add-int/lit8 v3, v15, 0x1

    const-wide/16 v4, 0x0

    goto/16 :goto_b

    .line 731
    :cond_10
    const-string v2, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    const-string v2, "\nIntervalles position : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 733
    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v2, :cond_11

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 734
    :cond_11
    const/4 v2, 0x0

    :goto_d
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-ge v2, v3, :cond_13

    .line 735
    if-lez v2, :cond_12

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 736
    :cond_12
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    sub-int/2addr v3, v4

    add-int/2addr v3, v2

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v4, v4

    add-int/2addr v3, v4

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v4, v4

    rem-int/2addr v3, v4

    .line 737
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v3, v4, v3

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 734
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 739
    :cond_13
    const-string v2, "\nRetour \u2014 absence : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-gez v3, :cond_14

    const-string v3, "inconnue"

    goto :goto_e

    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_e
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 740
    const-string v2, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 741
    const-string v2, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 742
    const/4 v2, 0x0

    :goto_f
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    const-string v4, "\n"

    if-ge v2, v3, :cond_15

    .line 743
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    sub-int/2addr v3, v5

    add-int/2addr v3, v2

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v5, v5

    add-int/2addr v3, v5

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v5, v5

    rem-int/2addr v3, v5

    .line 744
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v3, v5, v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 742
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 746
    :cond_15
    const-string v2, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 747
    const/4 v2, 0x0

    :goto_10
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    if-ge v2, v3, :cond_16

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 748
    :cond_16
    const-string v2, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 749
    const/4 v2, 0x0

    :goto_11
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-ge v2, v3, :cond_17

    .line 750
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    sub-int/2addr v3, v5

    add-int/2addr v3, v2

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v5, v5

    add-int/2addr v3, v5

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v5, v5

    rem-int/2addr v3, v5

    .line 751
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v3, v6, v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 749
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 753
    :cond_17
    const-string v2, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 754
    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticReport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 755
    invoke-static {}, Lcom/melodix/music/PreviewPlayerVolume;->diagnosticReport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 756
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->diagnosticReport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 757
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private resetDivergence()V
    .locals 2

    .line 342
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const-string v0, "none"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    return-void
.end method

.method private saveInProcess()V
    .locals 2

    .line 261
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 262
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    .line 263
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 264
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 265
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

    .line 266
    return-void
.end method

.method private scheduleFrame()V
    .locals 2

    .line 425
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

    .line 426
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 3

    .line 351
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 352
    :cond_0
    return-void
.end method

.method private seekDiagFinish(Ljava/lang/String;)V
    .locals 5

    .line 57
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v1, v0, v1

    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v1, v0, v1

    cmp-long v0, v1, v3

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
    .locals 1

    .line 321
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 322
    instance-of p2, p1, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_1

    .line 323
    check-cast p1, Landroid/widget/ProgressBar;

    .line 324
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    move-result p2

    const/16 v0, 0x3e8

    if-eq p2, v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 325
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p2

    if-eq p2, p3, :cond_1

    invoke-virtual {p1, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 327
    :cond_1
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .line 377
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v0, p1

    .line 378
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, p1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, p1

    const/16 v2, 0xff

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v1, v0, p1

    .line 379
    :cond_1
    return-void
.end method

.method private syncGlow()V
    .locals 8

    .line 381
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 382
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lt v1, v2, :cond_1

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v4

    .line 383
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v5

    .line 384
    if-eqz v0, :cond_2

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v1, :cond_2

    .line 385
    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_2

    const-wide/16 v1, 0x0

    cmpl-double v1, v5, v1

    if-lez v1, :cond_2

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v1, v1

    cmpg-double v1, v5, v1

    if-gez v1, :cond_2

    goto :goto_2

    :cond_2
    move v4, v3

    .line 386
    :goto_2
    const v1, 0x7f09024d

    const v2, 0x7f09023d

    filled-new-array {v1, v2}, [I

    move-result-object v1

    .line 387
    nop

    :goto_3
    const/4 v2, 0x2

    if-ge v3, v2, :cond_7

    .line 388
    const/4 v5, 0x0

    if-nez v0, :cond_3

    move-object v6, v5

    goto :goto_4

    :cond_3
    aget v6, v1, v3

    invoke-virtual {v0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 389
    :goto_4
    nop

    .line 390
    if-eqz v4, :cond_4

    instance-of v7, v6, Landroid/widget/ProgressBar;

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 391
    check-cast v6, Landroid/widget/ProgressBar;

    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 392
    instance-of v7, v6, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v7, :cond_4

    .line 393
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 394
    check-cast v6, Landroid/graphics/drawable/LayerDrawable;

    const v5, 0x102000d

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 397
    :cond_4
    if-nez v5, :cond_5

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    goto :goto_5

    .line 398
    :cond_5
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aget-object v6, v6, v3

    if-ne v5, v6, :cond_6

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v6, v6, v3

    if-eqz v6, :cond_6

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v6, v6, v3

    invoke-virtual {v6}, Landroid/animation/ObjectAnimator;->isStarted()Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_5

    .line 399
    :cond_6
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 400
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v5, v6, v3

    .line 401
    const/16 v6, 0x96

    const/16 v7, 0xff

    filled-new-array {v6, v7}, [I

    move-result-object v6

    const-string v7, "alpha"

    invoke-static {v5, v7, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 402
    const-wide/16 v6, 0x640

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 403
    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 404
    const/4 v2, -0x1

    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 405
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v5, v2, v3

    .line 406
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 387
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 408
    :cond_7
    return-void
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 287
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 288
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    :cond_0
    return-void
.end method


# virtual methods
.method public activityCreated()V
    .locals 4

    .line 210
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    return-void

    .line 211
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 214
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_2

    .line 216
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 217
    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J
    :try_end_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 218
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :cond_1
    :goto_0
    nop

    .line 220
    :cond_2
    return-void
.end method

.method public activityPaused()V
    .locals 1

    .line 329
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 6

    .line 344
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 345
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    const-wide/16 v2, -0x1

    goto :goto_0

    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    :goto_0
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    .line 346
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 347
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 348
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResume ; absence="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    cmp-long v1, v1, v4

    if-gez v1, :cond_1

    const-string v1, "inconnue"

    goto :goto_1

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 349
    return-void
.end method

.method public activityStarted()V
    .locals 1

    .line 328
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 1

    .line 372
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    const-string v0, "onStop (sans onPause observ\u00e9)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    .line 373
    :cond_0
    const-string v0, "onStop ; position fig\u00e9e ; signal audio natif=non lu (incertain)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 374
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 375
    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .line 655
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 658
    return-void
.end method

.method public attachSeek(Landroid/webkit/WebView;)V
    .locals 1

    .line 61
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 62
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const v0, 0x7f09023d

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 63
    :goto_0
    instance-of v0, p1, Landroid/widget/SeekBar;

    if-eqz v0, :cond_1

    .line 64
    move-object v0, p1

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 65
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 67
    :cond_1
    return-void
.end method

.method public begin(I)V
    .locals 2

    .line 650
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 651
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 652
    return-void
.end method

.method public command()V
    .locals 4

    .line 653
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v2, 0x0

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
    .locals 6

    .line 428
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 429
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    .line 430
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 431
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    const-wide/16 v2, 0x0

    if-eqz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    .line 432
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 433
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v0

    if-gtz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v4, v0, v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 435
    :cond_1
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz p2, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_2

    .line 436
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 438
    :cond_2
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 439
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_3

    return-void

    .line 440
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 441
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide p1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v0, v0

    cmpg-double p1, p1, v0

    if-ltz p1, :cond_5

    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerController;->correctionInProgress(J)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 442
    :cond_6
    return-void
.end method

.method public loadState(Ljava/lang/String;)V
    .locals 4

    .line 185
    if-eqz p1, :cond_3

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 187
    const-string v0, "waiting-bridge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 188
    :cond_1
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    return-void

    .line 190
    :cond_2
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 191
    return-void

    .line 185
    :cond_3
    :goto_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .line 89
    if-eqz p3, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const/16 p1, 0x3e8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 p2, 0x0

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-long p1, p1

    mul-long/2addr v2, p1

    long-to-double p1, v2

    const-wide v2, 0x408f400000000000L    # 1000.0

    div-double/2addr p1, v2

    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 91
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 92
    return-void

    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .line 77
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz p1, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_2

    .line 78
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    double-to-long v4, v4

    .line 79
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz p1, :cond_1

    .line 80
    const-string p1, "remplac\u00e9 par un nouveau geste"

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 81
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 82
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v10, "playing"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    sub-long v10, v0, v10

    invoke-static {v2, v3, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    goto :goto_0

    :cond_0
    move-wide v10, v2

    :goto_0
    add-long/2addr v8, v10

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    long-to-double v2, v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    .line 83
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 85
    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 87
    :cond_2
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 15

    .line 94
    move-object v0, p0

    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void

    .line 95
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    .line 96
    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_5

    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v1, :cond_1

    goto/16 :goto_2

    .line 97
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 98
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v5, v5

    rem-int/2addr v3, v5

    iput v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 99
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v5, v5

    if-ge v3, v5, :cond_2

    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    add-int/2addr v3, v4

    iput v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    .line 100
    :cond_2
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    .line 101
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aput-wide v5, v9, v3

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aput-wide v1, v9, v3

    .line 102
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    iget-object v11, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    const-wide/16 v13, -0x1

    aput-wide v13, v12, v3

    aput-wide v13, v11, v3

    aput-wide v13, v10, v3

    aput-wide v13, v9, v3

    .line 103
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    const-wide/16 v13, 0x0

    cmp-long v10, v10, v13

    if-gez v10, :cond_3

    const-wide/16 v13, -0x1

    goto :goto_0

    :cond_3
    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    sub-long v10, v1, v10

    invoke-static {v13, v14, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    :goto_0
    aput-wide v13, v9, v3

    .line 104
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    aput-wide v10, v9, v3

    .line 105
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v10, "en attente"

    aput-object v10, v9, v3

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aput-object v10, v9, v3

    .line 106
    invoke-direct {p0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v9

    double-to-long v9, v9

    iput-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 107
    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    add-long/2addr v9, v7

    iput-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 108
    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double v7, v7

    iput-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 109
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v2, "playing"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 110
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 111
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    .line 112
    if-eqz v1, :cond_4

    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "window.__sfPreviewSeek&&window.__sfPreviewSeek("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    .line 114
    invoke-static {v7}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v7}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ");"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 115
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v7

    aput-wide v7, v4, v3

    .line 116
    new-instance v4, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v4, p0, v3, v5, v6}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    invoke-virtual {v1, v2, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 124
    goto :goto_1

    :cond_4
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v2, "WebView indisponible"

    aput-object v2, v1, v3

    .line 125
    :goto_1
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v2, p0, v9, v10}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v3, 0x1388

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 134
    return-void

    .line 96
    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 69
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 p2, 0x3

    const/4 v0, 0x0

    if-ne p1, p2, :cond_0

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz p1, :cond_0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 70
    :cond_0
    return v0
.end method

.method public phase(Ljava/lang/String;)V
    .locals 7

    .line 197
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_8

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 198
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 199
    const-string v4, "rows-received"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    goto/16 :goto_0

    .line 200
    :cond_1
    const-string v4, "liked-route-other"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string p1, "page diff\u00e9rente"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 201
    :cond_2
    const-string v4, "liked-dom-empty"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string p1, "page lik\u00e9s vue, aucune ligne DOM observ\u00e9e"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 202
    :cond_3
    const-string v4, "liked-dom-rows"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string p1, "page lik\u00e9s vue, lignes DOM pr\u00e9sentes"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 203
    :cond_4
    const-string v4, "bridge-ready"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_5

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_0

    .line 204
    :cond_5
    const-string v4, "navigation"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_6

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    goto :goto_0

    .line 205
    :cond_6
    const-string v4, "page-ready|"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v5, v5, v2

    if-ltz v5, :cond_7

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v2, v5, v2

    if-gez v2, :cond_7

    .line 206
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    .line 207
    :cond_7
    :goto_0
    return-void

    .line 197
    :cond_8
    :goto_1
    return-void
.end method

.method public playlistOpened(Ljava/lang/String;)V
    .locals 4

    .line 222
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 223
    :cond_0
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-string v2, ""

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    const-string v3, "\u2014"

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 224
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 225
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 226
    if-eqz p1, :cond_2

    const-string v1, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 227
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 229
    :cond_2
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 231
    const-string v0, "home"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    if-eqz v0, :cond_0

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v0, v4, v2

    if-ltz v0, :cond_0

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v0, v4, v2

    if-gez v0, :cond_0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 232
    :cond_0
    const-string v0, "detail"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p1, v4, v2

    if-ltz p1, :cond_4

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 234
    :try_start_0
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 235
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-ge p2, p3, :cond_3

    .line 236
    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p3

    .line 237
    if-eqz p3, :cond_2

    const-string v0, "uri"

    const-string v4, "id"

    const-string v5, ""

    invoke-virtual {p3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "(?i)^spotify:track:[a-z0-9]+$"

    invoke-virtual {p3, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 238
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long p1, p1, v2

    if-gez p1, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 239
    :cond_1
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 240
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 235
    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 243
    :catch_0
    move-exception p1

    :cond_3
    :goto_1
    nop

    .line 245
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 246
    return-void
.end method

.method public run()V
    .locals 12

    .line 354
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 355
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 356
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 357
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 358
    :cond_1
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    const-string v2, "\u2014"

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v6, v0, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 359
    :goto_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    iget v6, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "+"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    sub-long v8, v0, v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " s : identit\u00e9="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 360
    iget-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v8, :cond_3

    const-string v8, "oui"

    goto :goto_1

    :cond_3
    const-string v8, "non"

    :goto_1
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", \u00e9tat="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mesure="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, ", "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 361
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v6

    .line 362
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_5

    iget v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_5

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    mul-long/2addr v4, v10

    cmp-long v2, v2, v4

    if-ltz v2, :cond_5

    .line 363
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 364
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "t="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ms ; retour +"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long/2addr v0, v7

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ms ; affich\u00e9="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 365
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "-:--"

    goto :goto_2

    :cond_4
    double-to-long v1, v2

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; \u00e9tat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v5

    .line 367
    :cond_5
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 368
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_6

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 369
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 370
    return-void

    .line 355
    :cond_7
    :goto_3
    return-void
.end method

.method public showDiagnostics()V
    .locals 4

    .line 760
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 761
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 762
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    .line 763
    const-string v0, "Copier"

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 768
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 769
    return-void
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 47

    .line 450
    move-object/from16 v1, p0

    const-string v0, "range"

    const-string v2, "none"

    const-string v3, "previewPlaybackState"

    const-string v4, "previewProgressValid"

    const-string v5, "playing"

    const/4 v8, 0x0

    :try_start_0
    new-instance v9, Lorg/json/JSONObject;

    move-object/from16 v10, p1

    invoke-direct {v9, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 451
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v10

    .line 452
    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v13, "artist"

    const-string v14, "track"

    const-string v15, ""

    const-wide/16 v6, -0x1

    if-nez v12, :cond_3

    .line 453
    :try_start_1
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    const-string v0, "callback legacy ignor\u00e9 en arri\u00e8re-plan"

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void

    .line 457
    :cond_0
    invoke-virtual {v9, v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v13, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 458
    iget-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_2

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 459
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    iput-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 460
    iput-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 462
    :cond_2
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 463
    return-void

    .line 465
    :cond_3
    invoke-virtual {v9, v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v13, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 466
    const-string v14, "previewTrackUri"

    invoke-virtual {v9, v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 467
    const-string v8, "previewPositionMs"

    move-object/from16 v16, v14

    move-object/from16 p1, v15

    invoke-virtual {v9, v8, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v14

    const-string v8, "previewDurationMs"

    move-wide/from16 v17, v10

    invoke-virtual {v9, v8, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 468
    const/4 v8, 0x0

    invoke-virtual {v9, v5, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v19
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v8, "paused"

    if-eqz v19, :cond_4

    move-object v6, v5

    goto :goto_0

    :cond_4
    move-object v6, v8

    :goto_0
    :try_start_2
    invoke-virtual {v9, v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 469
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object/from16 v20, v0

    const-string v0, "unknown"

    if-nez v7, :cond_5

    :try_start_3
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    move-object v6, v0

    .line 471
    :cond_5
    invoke-virtual {v9, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 472
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    move-object v3, v0

    .line 473
    :cond_6
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 474
    const/4 v7, 0x0

    invoke-virtual {v9, v4, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_7

    const-wide/16 v21, 0x0

    cmp-long v4, v10, v21

    if-lez v4, :cond_7

    cmp-long v4, v14, v21

    if-ltz v4, :cond_7

    cmp-long v4, v14, v10

    if-gtz v4, :cond_7

    const/4 v4, 0x1

    goto :goto_1

    :cond_7
    const/4 v4, 0x0

    .line 475
    :goto_1
    invoke-static {v12}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-static {v13}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    const-wide/16 v21, 0x0

    cmp-long v8, v10, v21

    if-lez v8, :cond_8

    const/4 v8, 0x1

    goto :goto_2

    :cond_8
    const/4 v8, 0x0

    .line 476
    :goto_2
    if-eqz v8, :cond_b

    iget-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v7, :cond_a

    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 477
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    move-object v7, v12

    move-object/from16 v23, v13

    iget-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v12, v12, v10

    if-eqz v12, :cond_c

    goto :goto_3

    :cond_9
    move-object v7, v12

    move-object/from16 v23, v13

    goto :goto_3

    .line 476
    :cond_a
    move-object v7, v12

    move-object/from16 v23, v13

    .line 477
    :goto_3
    const/4 v12, 0x1

    goto :goto_4

    .line 476
    :cond_b
    move-object v7, v12

    move-object/from16 v23, v13

    .line 477
    :cond_c
    const/4 v12, 0x0

    .line 478
    :goto_4
    move-object v13, v6

    move-wide/from16 v24, v10

    move-wide/from16 v10, v17

    move-object/from16 v17, v7

    invoke-direct {v1, v10, v11}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v6

    .line 479
    if-nez v12, :cond_d

    if-eqz v4, :cond_d

    move-wide/from16 v26, v10

    iget-wide v10, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v21, 0x0

    cmp-long v10, v10, v21

    if-ltz v10, :cond_e

    iget-wide v10, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v28, 0x7d0

    sub-long v10, v10, v28

    cmp-long v10, v14, v10

    if-gez v10, :cond_e

    const/4 v10, 0x1

    goto :goto_5

    :cond_d
    move-wide/from16 v26, v10

    :cond_e
    const/4 v10, 0x0

    .line 480
    :goto_5
    if-eqz v4, :cond_f

    if-nez v12, :cond_f

    if-nez v10, :cond_f

    iget-wide v10, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v21, 0x0

    cmp-long v10, v10, v21

    if-ltz v10, :cond_f

    iget-wide v10, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v10, v14, v10

    if-eqz v10, :cond_f

    .line 481
    :cond_f
    iget-boolean v10, v1, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v10, :cond_10

    iget-boolean v10, v1, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v10, :cond_10

    if-eqz v5, :cond_10

    iget-boolean v10, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v10, :cond_10

    if-nez v12, :cond_10

    const/4 v10, 0x1

    goto :goto_6

    :cond_10
    const/4 v10, 0x0

    .line 482
    :goto_6
    iget-boolean v11, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 483
    move/from16 v18, v11

    const-string v11, "previewProgressSource"

    invoke-virtual {v9, v11, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 484
    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v28, v10

    move-object/from16 v10, v20

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_11

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v20, v10

    const-string v10, "media"

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_12

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v11, "clock"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_12

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    goto :goto_7

    :cond_11
    move-object/from16 v20, v10

    .line 487
    :cond_12
    :goto_7
    const-string v2, "previewObservedAtMs"

    const-wide/16 v10, -0x1

    invoke-virtual {v9, v2, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v29

    .line 488
    const-wide/16 v10, 0x0

    cmp-long v2, v29, v10

    if-gez v2, :cond_13

    const-wide/16 v10, -0x1

    goto :goto_8

    :cond_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v10, v10, v29

    .line 489
    :goto_8
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->foreground:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v29, v9

    const-string v9, " ; source="

    move/from16 v30, v5

    const-string v5, " ms ; \u00e2ge observation="

    move/from16 v31, v12

    const-string v12, "mesure="

    const-string v32, "inconnu"

    move-object/from16 v33, v0

    const-string v0, " ms"

    if-nez v2, :cond_15

    .line 490
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-wide/16 v4, 0x0

    cmp-long v4, v10, v4

    if-gez v4, :cond_14

    :goto_9
    move-object/from16 v0, v32

    goto :goto_a

    :cond_14
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    goto :goto_9

    :goto_a
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ; \u00e9tat page="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ; rejet\u00e9e : arri\u00e8re-plan ; signal audio natif=non lu"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 492
    return-void

    .line 494
    :cond_15
    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    const-wide/high16 v34, 0x7ff8000000000000L    # Double.NaN

    move-object/from16 v36, v3

    if-eqz v2, :cond_16

    move-wide/from16 v2, v34

    goto :goto_b

    :cond_16
    long-to-double v2, v14

    sub-double/2addr v2, v6

    .line 495
    :goto_b
    move-object/from16 v37, v9

    iget-boolean v9, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const-wide/16 v38, 0xbb8

    if-eqz v9, :cond_17

    move-wide/from16 v40, v2

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const-wide/16 v21, 0x0

    cmp-long v2, v2, v21

    if-ltz v2, :cond_18

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v2, v26, v2

    const-wide/16 v42, 0x3e8

    cmp-long v2, v2, v42

    if-ltz v2, :cond_18

    if-eqz v4, :cond_18

    const-wide/16 v2, 0x0

    cmp-long v9, v10, v2

    if-ltz v9, :cond_18

    cmp-long v2, v10, v38

    if-gez v2, :cond_18

    if-eqz v8, :cond_18

    .line 496
    move-object/from16 v2, v33

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    const/4 v3, 0x1

    goto :goto_c

    .line 495
    :cond_17
    move-wide/from16 v40, v2

    :cond_18
    move-object/from16 v2, v33

    .line 496
    :cond_19
    const/4 v3, 0x0

    .line 500
    :goto_c
    if-eqz v4, :cond_1b

    const-wide/16 v21, 0x0

    cmp-long v9, v10, v21

    if-ltz v9, :cond_1b

    cmp-long v9, v10, v38

    if-gez v9, :cond_1b

    iget-boolean v9, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v9, :cond_1b

    iget-boolean v9, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v9, :cond_1b

    if-eqz v8, :cond_1b

    if-nez v31, :cond_1b

    iget-boolean v9, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v9, :cond_1b

    if-eqz v30, :cond_1b

    const-wide/16 v42, 0x2710

    cmp-long v9, v24, v42

    if-ltz v9, :cond_1b

    .line 502
    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v9

    if-nez v9, :cond_1a

    move-object/from16 v33, v12

    move-object v9, v13

    sub-long v12, v24, v38

    long-to-double v12, v12

    cmpl-double v12, v6, v12

    if-ltz v12, :cond_1c

    cmp-long v12, v14, v38

    if-gtz v12, :cond_1c

    const/4 v12, 0x1

    goto :goto_e

    :cond_1a
    move-object/from16 v33, v12

    move-object v9, v13

    goto :goto_d

    .line 500
    :cond_1b
    move-object/from16 v33, v12

    move-object v9, v13

    .line 502
    :cond_1c
    :goto_d
    const/4 v12, 0x0

    .line 503
    :goto_e
    iget-object v13, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v42, v2

    move-object/from16 v2, v20

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const-wide/16 v43, 0x1f40

    goto :goto_f

    :cond_1d
    const-wide/16 v43, 0x1388

    :goto_f
    move-wide/from16 v45, v43

    .line 504
    if-nez v4, :cond_1e

    const-string v2, "invalide"

    :goto_10
    move v4, v3

    move/from16 v20, v12

    goto/16 :goto_11

    :cond_1e
    const-wide/16 v20, 0x0

    cmp-long v2, v10, v20

    if-gez v2, :cond_1f

    const-string v2, "\u00e2ge inconnu"

    goto :goto_10

    .line 505
    :cond_1f
    cmp-long v2, v10, v38

    if-ltz v2, :cond_20

    const-string v2, "observation ancienne"

    move v4, v3

    move/from16 v20, v12

    goto :goto_11

    .line 506
    :cond_20
    if-nez v8, :cond_21

    const-string v2, "identit\u00e9 incompl\u00e8te"

    move v4, v3

    move/from16 v20, v12

    goto :goto_11

    .line 507
    :cond_21
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v2, :cond_22

    if-nez v3, :cond_22

    const-string v2, "attente retour 1 s"

    move v4, v3

    move/from16 v20, v12

    goto :goto_11

    .line 508
    :cond_22
    if-nez v12, :cond_23

    if-nez v3, :cond_23

    if-nez v31, :cond_23

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_23

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v2, :cond_23

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_23

    move v2, v12

    long-to-double v12, v14

    sub-double/2addr v12, v6

    .line 509
    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    move/from16 v20, v2

    move v4, v3

    move-wide/from16 v2, v45

    long-to-double v2, v2

    cmpl-double v2, v12, v2

    if-ltz v2, :cond_24

    const-string v2, "\u00e9cart >= seuil"

    goto :goto_11

    .line 508
    :cond_23
    move v4, v3

    move/from16 v20, v12

    .line 509
    :cond_24
    move-object/from16 v2, p1

    .line 512
    :goto_11
    const-string v3, "\u00e9cart >= seuil"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 513
    const-wide/16 v12, 0x0

    cmpl-double v3, v40, v12

    if-lez v3, :cond_25

    const/4 v3, 0x1

    goto :goto_12

    :cond_25
    const/4 v3, -0x1

    .line 514
    :goto_12
    iget-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const-wide/16 v21, 0x0

    cmp-long v12, v12, v21

    if-ltz v12, :cond_27

    iget-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    sub-long v12, v26, v12

    const-wide/16 v38, 0x1388

    cmp-long v12, v12, v38

    if-gtz v12, :cond_27

    iget v12, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    if-ne v3, v12, :cond_27

    iget-object v12, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iget-object v13, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_26

    goto :goto_13

    :cond_26
    move-wide/from16 v12, v26

    move-object/from16 v26, v9

    goto :goto_14

    .line 515
    :cond_27
    :goto_13
    move-wide/from16 v12, v26

    iput-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    move-object/from16 v26, v9

    const/4 v9, 0x0

    iput v9, v1, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    iput v3, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iput-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 517
    :goto_14
    iput-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    iget v3, v1, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v9, 0x1

    add-int/2addr v3, v9

    iput v3, v1, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    .line 518
    iget-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v3, :cond_29

    iget v3, v1, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v9, 0x3

    if-lt v3, v9, :cond_29

    move/from16 p1, v4

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    sub-long v3, v12, v3

    const-wide/16 v38, 0x2710

    cmp-long v3, v3, v38

    if-ltz v3, :cond_2a

    .line 519
    iput-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v3, v14

    sub-double/2addr v3, v6

    iput-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 520
    iget-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v3, :cond_28

    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 521
    :cond_28
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 522
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "resynchronisation douce ; \u00e9cart r\u00e9p\u00e9t\u00e9="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v38, v6

    move-wide/from16 v6, v40

    move-wide/from16 v40, v12

    double-to-long v12, v6

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 523
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_15

    .line 518
    :cond_29
    move/from16 p1, v4

    :cond_2a
    move-wide/from16 v38, v6

    move-wide/from16 v6, v40

    move-wide/from16 v40, v12

    goto :goto_15

    .line 525
    :cond_2b
    move/from16 p1, v4

    move-wide/from16 v38, v6

    move-wide/from16 v6, v40

    move-wide/from16 v40, v26

    move-object/from16 v26, v9

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    :goto_15
    nop

    .line 526
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    .line 527
    nop

    .line 528
    if-eqz v3, :cond_2d

    if-nez v31, :cond_2c

    iget-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v21, 0x0

    cmp-long v4, v12, v21

    if-ltz v4, :cond_2c

    iget-wide v12, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v4, v14, v12

    if-eqz v4, :cond_2d

    :cond_2c
    const/4 v4, 0x1

    goto :goto_16

    :cond_2d
    const/4 v4, 0x0

    .line 529
    :goto_16
    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 530
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v12, v33

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-gez v9, :cond_2e

    move-object/from16 v9, v32

    goto :goto_17

    :cond_2e
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_17
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v9, v37

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " ; \u00e9tat page="

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v9, v36

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " ; \u00e9cart="

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 531
    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v9

    if-eqz v9, :cond_2f

    :goto_18
    move-object/from16 v0, v32

    goto :goto_19

    :cond_2f
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    double-to-long v6, v6

    invoke-virtual {v9, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    goto :goto_18

    :goto_19
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " ; "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 532
    if-eqz v3, :cond_30

    const-string v5, "accept\u00e9e"

    goto :goto_1a

    :cond_30
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rejet\u00e9e : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1a
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 530
    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 533
    if-eqz v31, :cond_33

    .line 534
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v5, -0x1

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 535
    const/4 v5, 0x0

    iput-boolean v5, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v5, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v5, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 536
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    const-wide/16 v5, -0x1

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 538
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v5, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v6, v23

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    goto :goto_1b

    :cond_31
    move-object/from16 v6, v23

    :goto_1b
    const-wide/16 v9, -0x1

    iput-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 540
    :cond_32
    move-wide/from16 v9, v34

    goto :goto_1c

    .line 533
    :cond_33
    move-object/from16 v5, v17

    move-object/from16 v6, v23

    move-wide/from16 v9, v38

    .line 540
    :goto_1c
    if-eqz v8, :cond_34

    iput-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-wide/from16 v5, v24

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    goto :goto_1d

    :cond_34
    move-wide/from16 v5, v24

    .line 541
    :goto_1d
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_36

    if-eqz v31, :cond_35

    goto :goto_1e

    :cond_35
    move-object/from16 v0, v16

    goto :goto_1f

    :cond_36
    :goto_1e
    move-object/from16 v0, v16

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 544
    :goto_1f
    const-string v7, "previewConfirmPositionMs"

    move-wide/from16 v16, v14

    move-object/from16 v11, v29

    const-wide/16 v12, -0x1

    invoke-virtual {v11, v7, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 545
    if-eqz v8, :cond_38

    const-wide/16 v11, 0x0

    cmp-long v7, v14, v11

    if-ltz v7, :cond_38

    cmp-long v7, v14, v5

    if-gtz v7, :cond_38

    .line 546
    iget-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v7, :cond_37

    if-nez v31, :cond_37

    iget v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v7, :cond_37

    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v11, v7, v11

    const-wide/16 v21, 0x0

    cmp-long v7, v11, v21

    if-ltz v7, :cond_37

    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v11, v7, v11

    const-wide/16 v21, 0x0

    cmp-long v7, v11, v21

    if-gez v7, :cond_37

    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v11, v7, v11

    cmp-long v7, v14, v11

    if-eqz v7, :cond_37

    .line 548
    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v40, v7, v11

    .line 549
    :cond_37
    iput-wide v14, v1, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v11, v40

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    goto :goto_20

    .line 545
    :cond_38
    move-wide/from16 v11, v40

    .line 551
    :goto_20
    if-eqz v3, :cond_39

    iget-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-eqz v7, :cond_39

    iget-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v7, :cond_39

    const/4 v7, 0x0

    iput-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 552
    :cond_39
    if-eqz p1, :cond_3a

    if-eqz v3, :cond_3a

    .line 553
    const/4 v7, 0x0

    iput-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 554
    const-string v7, "retour confirm\u00e9 par observation coh\u00e9rente ; son non v\u00e9rifi\u00e9"

    invoke-direct {v1, v7}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 556
    :cond_3a
    nop

    .line 557
    iget-boolean v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v7, :cond_44

    if-nez v31, :cond_44

    .line 558
    nop

    .line 559
    if-eqz v30, :cond_3b

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v3, v11, v3

    move v13, v8

    const-wide/16 v7, 0x0

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    goto :goto_21

    :cond_3b
    move v13, v8

    const-wide/16 v3, 0x0

    .line 560
    :goto_21
    iget-wide v7, v1, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v7, v3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 561
    const-wide/16 v7, 0x0

    cmp-long v16, v14, v7

    if-ltz v16, :cond_3c

    cmp-long v7, v14, v5

    if-gtz v7, :cond_3c

    .line 562
    iput-wide v14, v1, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 564
    :cond_3c
    if-ltz v16, :cond_3f

    sub-long v3, v14, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    const-wide/16 v7, 0x9c4

    cmp-long v3, v3, v7

    if-lez v3, :cond_3d

    goto :goto_22

    .line 572
    :cond_3d
    iget v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v3, :cond_3e

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v11, v3, v4

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v7, "position UI proche de la cible"

    aput-object v7, v3, v4

    .line 573
    :cond_3e
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v7, 0x1

    add-long/2addr v3, v7

    iput-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 574
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    .line 575
    const-wide/16 v7, -0x1

    iput-wide v7, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v7, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move v4, v3

    move-object/from16 v2, v26

    move/from16 v8, v30

    move-object/from16 v7, v42

    const/16 v16, 0x1

    goto :goto_25

    .line 565
    :cond_3f
    :goto_22
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_40

    if-nez v30, :cond_40

    invoke-direct {v1, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 566
    :cond_40
    if-eqz v30, :cond_41

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_41

    const/4 v0, 0x1

    goto :goto_23

    :cond_41
    const/4 v0, 0x0

    :goto_23
    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_42

    move-object/from16 v2, v26

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_24

    :cond_42
    move-object/from16 v2, v26

    :goto_24
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 567
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_43

    move-object/from16 v7, v42

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    move/from16 v8, v30

    iput-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_43

    iput-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 568
    :cond_43
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void

    .line 557
    :cond_44
    move v13, v8

    move-object/from16 v2, v26

    move/from16 v8, v30

    move-object/from16 v7, v42

    .line 577
    move-wide/from16 v14, v16

    const/16 v16, 0x0

    :goto_25
    if-eqz v3, :cond_57

    .line 578
    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 579
    move-object/from16 v17, v0

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_51

    if-nez v31, :cond_51

    if-nez v20, :cond_51

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_45

    move-object/from16 v26, v2

    move/from16 p1, v3

    goto/16 :goto_2b

    .line 582
    :cond_45
    if-eqz p1, :cond_4b

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_4b

    .line 585
    if-eqz v8, :cond_47

    long-to-double v5, v14

    sub-double/2addr v5, v9

    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    move-result-wide v5

    const-wide v18, 0x40a7700000000000L    # 3000.0

    cmpl-double v0, v5, v18

    if-ltz v0, :cond_46

    goto :goto_26

    :cond_46
    const/4 v0, 0x0

    goto :goto_27

    :cond_47
    :goto_26
    const/4 v0, 0x1

    .line 586
    :goto_27
    if-eqz v0, :cond_48

    long-to-double v5, v14

    goto :goto_28

    :cond_48
    move-wide v5, v9

    :goto_28
    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    if-eqz v0, :cond_49

    const-wide/16 v5, 0x0

    goto :goto_29

    :cond_49
    long-to-double v5, v14

    sub-double/2addr v5, v9

    :goto_29
    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 587
    if-eqz v0, :cond_4a

    const-string v0, "retour : saut"

    goto :goto_2a

    :cond_4a
    const-string v0, "retour : correction <=1,25x"

    :goto_2a
    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 588
    move-object/from16 v26, v2

    move/from16 p1, v3

    goto/16 :goto_2c

    :cond_4b
    if-eqz v16, :cond_4c

    if-nez v8, :cond_4c

    .line 589
    long-to-double v5, v5

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    move-object/from16 v26, v2

    move/from16 p1, v3

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v5

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v2, v14

    sub-double/2addr v2, v9

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2c

    .line 588
    :cond_4c
    move-object/from16 v26, v2

    move/from16 p1, v3

    .line 590
    if-eqz v4, :cond_4d

    if-nez v8, :cond_4d

    if-nez v28, :cond_4d

    .line 591
    long-to-double v2, v5

    invoke-static {v2, v3, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    const-wide/16 v5, 0x0

    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2c

    .line 592
    :cond_4d
    if-eqz v4, :cond_4e

    if-nez v28, :cond_4e

    .line 593
    long-to-double v2, v5

    invoke-static {v2, v3, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    const-wide/16 v5, 0x0

    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v2, v14

    sub-double/2addr v2, v9

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2c

    .line 594
    :cond_4e
    if-eqz v18, :cond_4f

    if-eqz v8, :cond_50

    if-nez v28, :cond_50

    :cond_4f
    if-nez v18, :cond_52

    if-eqz v8, :cond_52

    .line 595
    :cond_50
    long-to-double v2, v5

    invoke-static {v2, v3, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    const-wide/16 v5, 0x0

    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v5, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2c

    .line 579
    :cond_51
    move-object/from16 v26, v2

    move/from16 p1, v3

    .line 580
    :goto_2b
    long-to-double v2, v14

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 581
    if-eqz v20, :cond_52

    const-string v0, "retour d\u00e9but observ\u00e9 ; lecture non command\u00e9e"

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 597
    :cond_52
    :goto_2c
    if-eqz v4, :cond_54

    .line 598
    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_53

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v0, v2, v4

    if-ltz v0, :cond_53

    if-eqz v8, :cond_53

    .line 599
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v3, v11, v3

    aput-wide v3, v0, v2

    .line 600
    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v2, v2

    rem-int/2addr v0, v2

    iput v0, v1, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 601
    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v2, v2

    if-ge v0, v2, :cond_53

    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    iput v0, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 603
    :cond_53
    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v14, v1, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 605
    :cond_54
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 606
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_55

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_55

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 607
    :cond_55
    if-eqz v13, :cond_56

    if-eqz v8, :cond_56

    if-nez v28, :cond_56

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_56

    const/4 v0, 0x1

    goto :goto_2d

    :cond_56
    const/4 v0, 0x0

    :goto_2d
    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_2f

    .line 608
    :cond_57
    move-object/from16 v17, v0

    move-object/from16 v26, v2

    move/from16 p1, v3

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_5b

    if-nez v31, :cond_5b

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_5b

    .line 609
    if-eqz v8, :cond_58

    if-eqz v28, :cond_59

    :cond_58
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_59

    iput-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 610
    :cond_59
    if-eqz v8, :cond_5a

    if-nez v28, :cond_5a

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_5a

    const/4 v0, 0x1

    goto :goto_2e

    :cond_5a
    const/4 v0, 0x0

    :goto_2e
    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_2f

    .line 611
    :cond_5b
    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 612
    :goto_2f
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_5c

    move-object/from16 v0, v26

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_30

    :cond_5c
    move-object/from16 v0, v26

    .line 613
    :goto_30
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 614
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v2, :cond_60

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_60

    .line 615
    if-eqz v8, :cond_5d

    if-eqz p1, :cond_5d

    const/4 v2, 0x1

    goto :goto_31

    :cond_5d
    const/4 v2, 0x0

    :goto_31
    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 616
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v2, :cond_5e

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-ne v8, v2, :cond_5e

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 617
    :cond_5e
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v2, :cond_60

    if-eqz v8, :cond_5f

    if-eqz p1, :cond_5f

    const/4 v2, 0x1

    goto :goto_32

    :cond_5f
    const/4 v2, 0x0

    :goto_32
    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 619
    :cond_60
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 620
    const-string v2, "apr\u00e8s mesure"

    invoke-direct {v1, v2}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 621
    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_63

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_63

    iget-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_63

    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_61

    .line 622
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_61

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eq v8, v0, :cond_62

    :cond_61
    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v2, 0x1

    if-eq v0, v2, :cond_63

    .line 623
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_63

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v2, v17

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_63

    .line 624
    :cond_62
    iput-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->uiAt:J
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 630
    :cond_63
    goto :goto_34

    .line 626
    :catch_0
    move-exception v0

    .line 627
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v2

    .line 628
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_64

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_64

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->base:D

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_33

    :cond_64
    const/4 v2, 0x0

    .line 629
    :goto_33
    iput-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v0, "mesure rejet\u00e9e : format invalide"

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 631
    :goto_34
    return-void
.end method

.method public tapPlayPause()I
    .locals 5

    .line 633
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 634
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_0

    const/4 v0, -0x1

    return v0

    .line 635
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 636
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v3, :cond_1

    invoke-direct {p0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v3

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 637
    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    xor-int/2addr v1, v0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 638
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 639
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 640
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v0, 0x1f40

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 647
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    return v0
.end method
