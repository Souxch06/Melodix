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

.field private cacheLoading:Z

.field private cacheReadMs:J

.field private cacheStart:J

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

.field private lastCacheWrite:J

.field private lastCachedHadArtwork:Z

.field private lastCachedIdentity:Ljava/lang/String;

.field private lastCachedState:Ljava/lang/String;

.field private lastConfirmedStateAt:J

.field private lastShownAt:J

.field private likedCollection:Z

.field private likedObservation:Ljava/lang/String;

.field private liveObserved:Z

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

.field private restored:Z

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

    .line 163
    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    .line 164
    const-string v0, ""

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    const-string v0, "unknown"

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    .line 183
    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 375
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/16 v4, 0x8

    const-wide/16 v2, -0x1

    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    .line 47
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    .line 48
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 53
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    .line 54
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    .line 55
    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    new-array v0, v4, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    .line 56
    new-array v0, v4, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    .line 57
    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 58
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    .line 139
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 140
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v0, "Temps restant : \u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 142
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 143
    const-string v0, "none"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 147
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 148
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 149
    const/16 v0, 0x78

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 151
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 152
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    .line 154
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    .line 157
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    .line 159
    const-string v0, "none"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 174
    new-array v0, v5, [Landroid/animation/ObjectAnimator;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 175
    new-array v0, v5, [Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 177
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 178
    const/16 v0, 0x3c

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 181
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 185
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 196
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 197
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 198
    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 211
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 225
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 226
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    .line 376
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 332
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 333
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz v0, :cond_0

    .line 334
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 335
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 336
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 337
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 338
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 339
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 340
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 342
    :cond_0
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    return-object v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    return-object v0
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 50
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    return-wide v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerController;D)V
    .locals 1

    .prologue
    .line 141
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 138
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerController;D)V
    .locals 1

    .prologue
    .line 141
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 146
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return v0
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 383
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 513
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 350
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 224
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    return-void
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 224
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    return v0
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 225
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    return-wide v0
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 225
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    return-void
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 224
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    return-void
.end method

.method static synthetic access$25(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 146
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return-void
.end method

.method static synthetic access$26(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    return-void
.end method

.method static synthetic access$27(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 155
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    return-void
.end method

.method static synthetic access$28(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return-void
.end method

.method static synthetic access$29(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$30(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    return-void
.end method

.method static synthetic access$31(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$32(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$33(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$34(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 138
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-void
.end method

.method static synthetic access$35(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 148
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    return-void
.end method

.method static synthetic access$36(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 142
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$37(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 148
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    return-void
.end method

.method static synthetic access$38(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 148
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    return-void
.end method

.method static synthetic access$39(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 1

    .prologue
    .line 47
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return v0
.end method

.method static synthetic access$40(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 369
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$41(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 498
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method static synthetic access$42(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 469
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    return-void
.end method

.method static synthetic access$43(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return v0
.end method

.method static synthetic access$44(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 138
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$45(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return-void
.end method

.method static synthetic access$46(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 50
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return-void
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 138
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 50
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    return-wide v0
.end method

.method private cancelSeek()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 76
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    const-string v0, "annul\u00e9 (identit\u00e9 chang\u00e9e ou invalide)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 77
    :cond_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 78
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

    .line 366
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    invoke-static {v12, v13, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    rem-long v2, v0, v6

    div-long v4, v0, v6

    rem-long/2addr v4, v6

    const-wide/16 v6, 0xe10

    div-long/2addr v0, v6

    .line 367
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

    .line 510
    const-wide v2, 0x40af400000000000L    # 4000.0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    cmpl-double v0, v0, v6

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    mul-double/2addr v0, v4

    :goto_0
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    .line 511
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    cmpl-double v2, v2, v6

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v2, p1, v2

    long-to-double v2, v2

    cmpg-double v0, v2, v0

    if-gez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    .line 510
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v0, v0

    const-wide/high16 v4, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v0, v4

    goto :goto_0

    .line 511
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private delta(J)Ljava/lang/String;
    .locals 5

    .prologue
    const-wide/16 v2, 0x0

    .line 759
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

    .line 777
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

    .line 778
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

    .line 784
    :goto_0
    return-object v0

    .line 779
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

    .line 780
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

    .line 781
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

    .line 782
    const-wide/16 v2, -0x1

    const-string v0, "ind\u00e9termin\u00e9e"

    move v1, v4

    .line 783
    :goto_3
    array-length v4, v5

    if-lt v1, v4, :cond_4

    .line 784
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

    .line 779
    :cond_2
    const-wide/16 v0, -0x1

    goto :goto_1

    .line 780
    :cond_3
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_2

    .line 783
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

.method private freezeForBackground(Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 420
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 421
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 422
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    .line 423
    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-nez v3, :cond_0

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 424
    :cond_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    .line 425
    const-string v0, "interrupted"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 426
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 427
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ; avant="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; apr\u00e8s=interrupted ; fig\u00e9e="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 428
    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "-:--"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; signal audio natif=non lu (incertain)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 427
    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 429
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 430
    return-void

    .line 428
    :cond_1
    double-to-long v2, v4

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private now()J
    .locals 2

    .prologue
    .line 350
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 5

    .prologue
    .line 773
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
    .line 352
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

    .line 355
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v2, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 363
    :goto_0
    return-wide v0

    .line 356
    :cond_0
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v2, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    goto :goto_0

    .line 357
    :cond_1
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v2, p1, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 358
    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v4, :cond_2

    move-wide v0, v2

    .line 361
    :cond_2
    const-wide v6, 0x40af400000000000L    # 4000.0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    cmpl-double v4, v4, v10

    if-lez v4, :cond_3

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v8, 0x4010000000000000L    # 4.0

    mul-double/2addr v4, v8

    :goto_1
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    .line 362
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    long-to-double v2, v2

    div-double/2addr v2, v4

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    mul-double/2addr v2, v6

    .line 363
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

    .line 361
    :cond_3
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v4, v4

    const-wide/high16 v8, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v4, v8

    goto :goto_1
.end method

.method private progressStopReason()Ljava/lang/String;
    .locals 4

    .prologue
    .line 761
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const-string v0, "lecture interrompue au d\u00e9part ; audio non v\u00e9rifi\u00e9"

    .line 770
    :goto_0
    return-object v0

    .line 762
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const-string v0, "\u00e9tat du lecteur indisponible"

    goto :goto_0

    .line 763
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_2

    const-string v0, "pause demand\u00e9e"

    goto :goto_0

    .line 764
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    goto :goto_0

    .line 765
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "lecture en pause"

    goto :goto_0

    .line 766
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_5

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    goto :goto_0

    .line 767
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_6

    const-string v0, "position ou dur\u00e9e indisponible"

    goto :goto_0

    .line 768
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_7

    const-string v0, "mouvement arr\u00eat\u00e9"

    goto :goto_0

    .line 769
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

    goto :goto_0

    .line 770
    :cond_8
    const-string v0, "animation active"

    goto :goto_0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 533
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

    .line 534
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 535
    const-string v0, "Lecture arr\u00eat\u00e9e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucune lecture en cours"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 533
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
    .line 166
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 167
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

    .line 168
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

    const-string v1, " ; \u00e9tat natif="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    aput-object v0, v2, v3

    .line 169
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    .line 170
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    .line 171
    :cond_0
    return-void

    .line 168
    :cond_1
    double-to-long v0, v0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private renderButtons()V
    .locals 5

    .prologue
    const v1, 0x7f080121

    .line 499
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v2, :cond_1

    .line 508
    :cond_0
    :goto_0
    return-void

    .line 501
    :cond_1
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    move v3, v1

    .line 502
    :goto_1
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v2, :cond_5

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eqz v1, :cond_4

    const-string v1, "Lecture demand\u00e9e, en attente"

    move-object v4, v1

    .line 505
    :goto_2
    const v1, 0x7f090238

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f09023e

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 506
    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 507
    :cond_2
    instance-of v0, v2, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, v2

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 501
    :cond_3
    const v2, 0x7f080122

    move v3, v2

    goto :goto_1

    .line 502
    :cond_4
    const-string v1, "Pause demand\u00e9e, en attente"

    move-object v4, v1

    goto :goto_2

    .line 503
    :cond_5
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v4, "unknown"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_6
    const-string v1, "\u00c9tat de lecture inconnu"

    move-object v4, v1

    goto :goto_2

    .line 504
    :cond_7
    if-ne v3, v1, :cond_8

    const-string v1, "Mettre en pause"

    move-object v4, v1

    goto :goto_2

    :cond_8
    const-string v1, "Lire"

    move-object v4, v1

    goto :goto_2
.end method

.method private renderProgress()V
    .locals 12

    .prologue
    .line 384
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 408
    :cond_0
    :goto_0
    return-void

    .line 385
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 386
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-ltz v1, :cond_2

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x1770

    cmp-long v1, v4, v6

    if-ltz v1, :cond_0

    .line 387
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 388
    const v1, 0x7f09024a

    const-string v2, "-:--"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    const-string v2, "-:--"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 389
    const v1, 0x7f09024d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v1, 0x7f09023d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 390
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 391
    if-nez v0, :cond_3

    const/4 v1, 0x0

    .line 392
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

    .line 393
    check-cast v1, Landroid/widget/TextView;

    const-string v0, "Temps restant : \u2014"

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 391
    :cond_3
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 396
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 397
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-long v4, v4

    const-wide/16 v6, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v8, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 398
    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v10, 0x3e8

    div-long v10, v4, v10

    cmp-long v1, v8, v10

    if-eqz v1, :cond_5

    const-wide/16 v8, 0x3e8

    div-long v8, v4, v8

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 399
    :cond_5
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    cmp-long v1, v4, v8

    if-eqz v1, :cond_6

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const-wide/16 v8, 0x3e8

    div-long/2addr v4, v8

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    .line 400
    :cond_6
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    const-wide/16 v8, 0x3e8

    div-long v8, v6, v8

    cmp-long v1, v4, v8

    if-eqz v1, :cond_7

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

    .line 401
    :cond_7
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

    .line 402
    const v2, 0x7f09024d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v2, 0x7f09023d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 403
    const v1, 0x7f09024a

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 404
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 405
    if-nez v0, :cond_8

    const/4 v1, 0x0

    .line 406
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

    .line 407
    check-cast v1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 405
    :cond_8
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

    .line 787
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 788
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

    .line 789
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 791
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 792
    const-string v0, "\nCache local : lecture et application des vues, sans mesure de frame : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_4

    const-string v0, "\u2014"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 794
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_5

    const-string v0, "\u2014"

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 795
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 796
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_6

    const-string v0, "\u2014"

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 797
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 798
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_7

    const-string v0, "\u2014"

    :goto_4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 799
    const-string v0, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 800
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_8

    const-string v0, "\u2014"

    :goto_5
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 801
    const-string v1, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 802
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 803
    const-string v0, "\nSource position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 804
    const-string v0, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_9

    const-string v0, "oui"

    :goto_6
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 805
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 806
    const-string v0, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_a

    const-string v0, "oui"

    :goto_7
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 807
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 808
    const-string v0, " ; \u00e2ge de la mesure : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_b

    const-string v0, "\u2014"

    :goto_8
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 809
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 810
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 811
    const-string v0, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_c

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    :goto_9
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {p0, v0, v1, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 812
    const-string v0, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 813
    const-string v0, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v0, :cond_0

    const-string v0, "\nLik\u00e9s : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 815
    const-string v1, " ; rendu natif : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_d

    const-string v0, "non observ\u00e9"

    :goto_a
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 816
    :cond_0
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 817
    const-string v0, " ; waiting-bridge avec lignes : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_e

    const-string v0, "ind\u00e9termin\u00e9"

    :goto_b
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 818
    const-string v0, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 819
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v0, :cond_1

    const-string v0, " aucun"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    move v0, v2

    .line 820
    :goto_c
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-lt v0, v1, :cond_11

    .line 832
    const-string v0, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 833
    const-string v0, "\nIntervalles position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 834
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v0, :cond_2

    const-string v0, "\u2014"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    move v0, v2

    .line 835
    :goto_d
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-lt v0, v1, :cond_13

    .line 840
    const-string v0, "\nRetour \u2014 absence : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    cmp-long v0, v4, v10

    if-gez v0, :cond_15

    const-string v0, "inconnue"

    :goto_e
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 841
    const-string v0, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    const-string v0, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v0, v2

    .line 843
    :goto_f
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    if-lt v0, v1, :cond_16

    .line 847
    const-string v0, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v0, v2

    .line 848
    :goto_10
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    if-lt v0, v1, :cond_17

    .line 849
    const-string v0, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 850
    :goto_11
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-lt v2, v0, :cond_18

    .line 854
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 855
    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 856
    invoke-static {}, Lcom/melodix/music/PreviewPlayerVolume;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 857
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 858
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 788
    :cond_3
    const-string v0, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    goto/16 :goto_0

    .line 792
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 794
    :cond_5
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

    goto/16 :goto_2

    .line 796
    :cond_6
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

    goto/16 :goto_3

    .line 798
    :cond_7
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

    goto/16 :goto_4

    .line 800
    :cond_8
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

    goto/16 :goto_5

    .line 804
    :cond_9
    const-string v0, "non"

    goto/16 :goto_6

    .line 806
    :cond_a
    const-string v0, "non"

    goto/16 :goto_7

    .line 808
    :cond_b
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

    goto/16 :goto_8

    .line 811
    :cond_c
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto/16 :goto_9

    .line 815
    :cond_d
    const-string v0, "lignes visibles"

    goto/16 :goto_a

    .line 817
    :cond_e
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v4, "waiting-bridge"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v0, :cond_10

    :cond_f
    const-string v0, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    goto/16 :goto_b

    :cond_10
    const-string v0, "non"

    goto/16 :goto_b

    .line 821
    :cond_11
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

    .line 822
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

    .line 823
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v6, v5, v1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    aget-wide v8, v5, v1

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 824
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

    .line 825
    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 826
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

    .line 827
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

    .line 828
    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 829
    const-string v4, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 830
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v6, v5, v1

    cmp-long v5, v6, v10

    if-gez v5, :cond_12

    const-string v1, "\u2014"

    :goto_12
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_c

    .line 830
    :cond_12
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

    goto :goto_12

    .line 836
    :cond_13
    if-lez v0, :cond_14

    const-string v1, ", "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 837
    :cond_14
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

    .line 838
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v4, v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " ms"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 835
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_d

    .line 840
    :cond_15
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

    goto/16 :goto_e

    .line 844
    :cond_16
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

    .line 845
    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v1, v5, v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 843
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_f

    .line 848
    :cond_17
    const-string v1, "\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_10

    .line 851
    :cond_18
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

    .line 852
    const-string v1, "\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v0, v4, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 850
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_11
.end method

.method private resetDivergence()V
    .locals 2

    .prologue
    .line 431
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

.method static sameArtists(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    .line 378
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 380
    :cond_0
    :goto_0
    return v0

    .line 379
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 380
    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 381
    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 380
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private saveInProcess()V
    .locals 2

    .prologue
    .line 344
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 345
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    .line 346
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 347
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 348
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

    .line 349
    return-void
.end method

.method private saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 15

    .prologue
    .line 280
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    if-eqz v2, :cond_0

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v3, :cond_1

    .line 297
    :cond_0
    :goto_0
    return-void

    .line 281
    :cond_1
    const-string v3, "previewObservedAtMs"

    const-wide/16 v4, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    .line 282
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "\n"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v8, "\n"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p7

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 283
    new-instance v9, Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-direct {v9}, Lcom/melodix/music/PreviewLastTrackStore$Record;-><init>()V

    .line 284
    move-object/from16 v0, p2

    iput-object v0, v9, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    move-object/from16 v0, p3

    iput-object v0, v9, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    move-object/from16 v0, p4

    iput-object v0, v9, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    move-wide/from16 v0, p5

    iput-wide v0, v9, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    move-wide/from16 v0, p7

    iput-wide v0, v9, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    iput-wide v4, v9, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    .line 285
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v9, v4, v5}, Lcom/melodix/music/PreviewLastTrackStore;->valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 286
    const/4 v4, 0x0

    const v3, 0x7f090244

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 287
    const-string v5, "cover"

    const-string v10, ""

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    instance-of v5, v3, Landroid/widget/ImageView;

    if-eqz v5, :cond_5

    .line 288
    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 289
    instance-of v5, v3, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v5, :cond_5

    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    .line 291
    :goto_1
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 292
    if-eqz v4, :cond_2

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    const-wide/16 v12, 0x0

    cmp-long v5, v10, v12

    if-ltz v5, :cond_2

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    sub-long v10, v6, v10

    const-wide/16 v12, 0x1388

    cmp-long v5, v10, v12

    if-gez v5, :cond_2

    .line 293
    if-eqz v3, :cond_0

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    if-nez v5, :cond_0

    .line 294
    :cond_2
    if-nez v3, :cond_4

    if-eqz v4, :cond_3

    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    if-nez v4, :cond_4

    :cond_3
    const/4 v4, 0x0

    :goto_2
    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    .line 295
    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 296
    invoke-static {v2, v9, v3}, Lcom/melodix/music/PreviewLastTrackStore;->save(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 294
    :cond_4
    const/4 v4, 0x1

    goto :goto_2

    :cond_5
    move-object v3, v4

    goto :goto_1
.end method

.method private scheduleFrame()V
    .locals 2

    .prologue
    .line 514
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

    .line 515
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 4

    .prologue
    .line 440
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 441
    :cond_0
    return-void
.end method

.method private seekDiagFinish(Ljava/lang/String;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 60
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

    .line 61
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-object p1, v0, v1

    .line 62
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 3

    .prologue
    const/16 v2, 0x3e8

    .line 410
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 411
    instance-of v1, v0, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 412
    check-cast v0, Landroid/widget/ProgressBar;

    .line 413
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 414
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v1

    if-eq v1, p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 416
    :cond_1
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 466
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v2, v0, p1

    .line 467
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

    .line 468
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

    .line 470
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 471
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v1, v5, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    .line 472
    :goto_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v6

    .line 473
    if-eqz v0, :cond_1

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v5, :cond_1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    if-eqz v1, :cond_1

    .line 474
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

    .line 473
    cmpg-double v1, v6, v8

    if-gez v1, :cond_1

    .line 475
    :goto_1
    new-array v5, v10, [I

    fill-array-data v5, :array_0

    .line 476
    :goto_2
    array-length v1, v5

    if-lt v2, v1, :cond_2

    .line 497
    return-void

    :cond_0
    move v1, v3

    .line 471
    goto :goto_0

    :cond_1
    move v3, v2

    .line 473
    goto :goto_1

    .line 477
    :cond_2
    if-nez v0, :cond_4

    move-object v1, v4

    .line 479
    :goto_3
    if-eqz v3, :cond_7

    instance-of v6, v1, Landroid/widget/ProgressBar;

    if-eqz v6, :cond_7

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 480
    check-cast v1, Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 481
    instance-of v6, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v6, :cond_7

    .line 482
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 483
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    const v6, 0x102000d

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 486
    :goto_4
    if-nez v1, :cond_5

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 476
    :cond_3
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 477
    :cond_4
    aget v1, v5, v2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_3

    .line 487
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

    .line 488
    :cond_6
    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 489
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v1, v6, v2

    .line 490
    const-string v6, "alpha"

    new-array v7, v10, [I

    fill-array-data v7, :array_1

    invoke-static {v1, v6, v7}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 491
    const-wide/16 v6, 0x640

    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 492
    invoke-virtual {v1, v10}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 493
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 494
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v6, v2

    .line 495
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_5

    :cond_7
    move-object v1, v4

    goto :goto_4

    .line 475
    nop

    :array_0
    .array-data 4
        0x7f09024d
        0x7f09023d
    .end array-data

    .line 490
    :array_1
    .array-data 4
        0x96
        0xff
    .end array-data
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 370
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 371
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

    .line 372
    :cond_0
    return-void
.end method


# virtual methods
.method public acceptPlayerPayload(Ljava/lang/String;)Z
    .locals 14

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 277
    :goto_0
    return v0

    .line 260
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    .line 262
    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 263
    const-string v1, "track"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "artist"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "previewPlaybackState"

    const-string v4, "unknown"

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 264
    const-string v4, "previewPositionMs"

    const-wide/16 v6, -0x1

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-string v6, "previewDurationMs"

    const-wide/16 v8, -0x1

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-string v10, "previewObservedAtMs"

    const-wide/16 v12, -0x1

    invoke-virtual {v0, v10, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    sub-long/2addr v8, v10

    .line 266
    const-string v10, "previewProgressValid"

    const/4 v11, 0x0

    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 267
    const-wide/16 v0, 0x0

    cmp-long v0, v6, v0

    if-lez v0, :cond_2

    const-wide/16 v0, 0x0

    cmp-long v0, v4, v0

    if-ltz v0, :cond_2

    cmp-long v0, v4, v6

    if-gtz v0, :cond_2

    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-ltz v0, :cond_2

    const-wide/16 v0, 0xbb8

    cmp-long v0, v8, v0

    if-gez v0, :cond_2

    .line 268
    const-string v0, "playing"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "paused"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 269
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 270
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v0, :cond_4

    .line 271
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 272
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    .line 273
    :goto_1
    if-nez v0, :cond_6

    const/4 v0, 0x0

    .line 274
    :goto_2
    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_4

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "LECTURE EN COURS"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    :cond_4
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 272
    :cond_5
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_1

    .line 273
    :cond_6
    const-string v1, "previewPlayerDragHandle"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_2

    .line 277
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public activityCreated()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 213
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 223
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 217
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 219
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 220
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

    .line 221
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public activityPaused()V
    .locals 1

    .prologue
    .line 418
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 433
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 434
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    .line 435
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 436
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 437
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

    .line 438
    return-void

    .line 434
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    sub-long v0, v2, v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_0

    .line 437
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
    .line 417
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 461
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    const-string v0, "onStop (sans onPause observ\u00e9)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    .line 462
    :cond_0
    const-string v0, "onStop ; position fig\u00e9e ; signal audio natif=non lu (incertain)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 463
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 464
    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 755
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 758
    return-void
.end method

.method public attachSeek(Landroid/webkit/WebView;)V
    .locals 2

    .prologue
    .line 64
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 65
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    const/4 v1, 0x0

    .line 66
    :goto_0
    instance-of v0, v1, Landroid/widget/SeekBar;

    if-eqz v0, :cond_0

    move-object v0, v1

    .line 67
    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 68
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 70
    :cond_0
    return-void

    .line 65
    :cond_1
    const v1, 0x7f09023d

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_0
.end method

.method public begin(I)V
    .locals 2

    .prologue
    .line 750
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 751
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 752
    return-void
.end method

.method public clearLastTrack()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 299
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/melodix/music/PreviewLastTrackStore;->clear(Landroid/content/Context;)V

    .line 300
    :cond_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 301
    sput-boolean v1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    sput-boolean v1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 302
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 303
    return-void
.end method

.method public command()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 753
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

    .line 517
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 518
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 531
    :cond_0
    :goto_0
    return-void

    .line 519
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 520
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    if-eqz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 521
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 522
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v0

    if-gtz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v2, v0, v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 524
    :cond_2
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 525
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 527
    :cond_3
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 528
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    .line 529
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 530
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

.method public layoutReady()V
    .locals 4

    .prologue
    .line 229
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 256
    :goto_0
    return-void

    .line 230
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    .line 231
    new-instance v1, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewLastTrackStore;->load(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Callback;)V

    goto :goto_0
.end method

.method public loadState(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 188
    if-eqz p1, :cond_0

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_3

    .line 190
    const-string v0, "waiting-bridge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 191
    :cond_2
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    goto :goto_0

    .line 193
    :cond_3
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 8

    .prologue
    .line 92
    if-eqz p3, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_1

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 93
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

    .line 94
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .prologue
    const-wide/16 v2, 0x0

    .line 80
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 81
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    double-to-long v6, v0

    .line 82
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    .line 83
    const-string v0, "remplac\u00e9 par un nouveau geste"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 85
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

    .line 86
    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 88
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 90
    :cond_1
    return-void

    :cond_2
    move-wide v0, v2

    .line 85
    goto :goto_0
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 137
    :goto_0
    return-void

    .line 98
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    .line 99
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_0

    .line 100
    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 101
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 102
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    .line 103
    :cond_3
    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v0

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    .line 104
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aput-wide v6, v0, v4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aput-wide v2, v0, v4

    .line 105
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    const-wide/16 v10, -0x1

    aput-wide v10, v8, v4

    aput-wide v10, v5, v4

    aput-wide v10, v1, v4

    aput-wide v10, v0, v4

    .line 106
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    const-wide/16 v8, 0x0

    cmp-long v0, v0, v8

    if-gez v0, :cond_4

    const-wide/16 v0, -0x1

    :goto_1
    aput-wide v0, v5, v4

    .line 107
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    aput-wide v8, v0, v4

    .line 108
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v1, "en attente"

    aput-object v1, v0, v4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    const-string v1, "en attente"

    aput-object v1, v0, v4

    .line 109
    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    double-to-long v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 110
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v0

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 111
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 112
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "playing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 113
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 114
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 115
    if-eqz v0, :cond_5

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "window.__sfPreviewSeek&&window.__sfPreviewSeek("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 117
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

    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 118
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v10

    aput-wide v10, v2, v4

    .line 119
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v2, p0, v4, v6, v7}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 128
    :goto_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v1, p0, v8, v9}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 136
    const-wide/16 v2, 0x1388

    .line 128
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 106
    :cond_4
    const-wide/16 v0, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    sub-long v8, v2, v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto/16 :goto_1

    .line 127
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

    .line 72
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 73
    :cond_0
    return v2
.end method

.method public phase(Ljava/lang/String;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 200
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_0

    if-nez p1, :cond_1

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 201
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 202
    const-string v2, "rows-received"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    goto :goto_0

    .line 203
    :cond_2
    const-string v2, "liked-route-other"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v0, "page diff\u00e9rente"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 204
    :cond_3
    const-string v2, "liked-dom-empty"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v0, "page lik\u00e9s vue, aucune ligne DOM observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 205
    :cond_4
    const-string v2, "liked-dom-rows"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v0, "page lik\u00e9s vue, lignes DOM pr\u00e9sentes"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 206
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

    .line 207
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

    .line 208
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

    .line 209
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

    .line 305
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 306
    :cond_0
    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 307
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

    .line 308
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 309
    if-eqz p1, :cond_2

    const-string v0, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 310
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 312
    :cond_2
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const-wide/16 v6, 0x0

    .line 314
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

    .line 315
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

    .line 317
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 318
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-lt v0, v2, :cond_2

    .line 328
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 329
    return-void

    .line 319
    :cond_2
    :try_start_1
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 320
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

    .line 321
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 322
    :cond_3
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 323
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_1

    .line 318
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x3e8

    const-wide/16 v8, 0x0

    .line 443
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 444
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 459
    :cond_0
    :goto_0
    return-void

    .line 445
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 446
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    cmp-long v0, v0, v8

    if-gez v0, :cond_2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 447
    :cond_2
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v0, v8

    if-gez v0, :cond_5

    const-string v0, "\u2014"

    .line 448
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

    .line 449
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

    .line 450
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

    .line 448
    aput-object v0, v4, v5

    .line 451
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

    .line 452
    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 453
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

    .line 454
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

    .line 453
    aput-object v0, v4, v5

    .line 456
    :cond_3
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 457
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_4

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 458
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    goto/16 :goto_0

    .line 447
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

    .line 449
    :cond_6
    const-string v1, "non"

    goto/16 :goto_2

    .line 454
    :cond_7
    double-to-long v0, v0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public showDiagnostics()V
    .locals 5

    .prologue
    .line 861
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 870
    :goto_0
    return-void

    .line 862
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 863
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 864
    const-string v3, "Copier"

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$6;

    invoke-direct {v4, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$6;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 869
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 38

    .prologue
    .line 539
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v6, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 540
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v28

    .line 541
    const-string v4, "previewProgressValid"

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 542
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v4, :cond_1

    const-string v4, "callback legacy ignor\u00e9 en arri\u00e8re-plan"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 728
    :cond_0
    :goto_0
    return-void

    .line 546
    :cond_1
    const-string v4, "track"

    const-string v5, ""

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "artist"

    const-string v7, ""

    invoke-virtual {v6, v5, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 549
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v6, :cond_3

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 550
    :cond_2
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

    .line 551
    const-wide/16 v4, -0x1

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v4, -0x1

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 553
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 724
    :catch_0
    move-exception v4

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    .line 725
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v6, :cond_4

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-nez v6, :cond_4

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

    .line 726
    :cond_4
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v4, "mesure rejet\u00e9e : format invalide"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    goto/16 :goto_0

    .line 556
    :cond_5
    :try_start_1
    const-string v4, "track"

    const-string v5, ""

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v4, "artist"

    const-string v5, ""

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 557
    const-string v4, "previewTrackUri"

    const-string v5, ""

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 558
    const-string v4, "previewPositionMs"

    const-wide/16 v10, -0x1

    invoke-virtual {v6, v4, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v20

    const-string v4, "previewDurationMs"

    const-wide/16 v10, -0x1

    invoke-virtual {v6, v4, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 559
    const-string v5, "previewPlaybackState"

    const-string v4, "playing"

    const/4 v9, 0x0

    invoke-virtual {v6, v4, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_a

    const-string v4, "playing"

    :goto_1
    invoke-virtual {v6, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 560
    const-string v4, "playing"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "paused"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v9, "unknown"

    .line 562
    :cond_6
    const-string v4, "previewPlaybackState"

    const-string v5, "unknown"

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 563
    const-string v5, "playing"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_59

    const-string v5, "paused"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_59

    const-string v4, "unknown"

    move-object/from16 v18, v4

    .line 564
    :goto_2
    const-string v4, "playing"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    .line 565
    const-string v4, "previewProgressValid"

    const/4 v5, 0x0

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_b

    const-wide/16 v4, 0x0

    cmp-long v4, v12, v4

    if-lez v4, :cond_b

    const-wide/16 v4, 0x0

    cmp-long v4, v20, v4

    if-ltz v4, :cond_b

    cmp-long v4, v20, v12

    if-gtz v4, :cond_b

    const/4 v4, 0x1

    move/from16 v16, v4

    .line 566
    :goto_3
    invoke-static {v7}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-static {v8}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    const-wide/16 v4, 0x0

    cmp-long v4, v12, v4

    if-lez v4, :cond_c

    const/4 v4, 0x1

    move/from16 v27, v4

    .line 567
    :goto_4
    if-eqz v27, :cond_d

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v4, :cond_7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 568
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v4, v4, v12

    if-eqz v4, :cond_d

    .line 567
    :cond_7
    const/4 v4, 0x1

    move/from16 v26, v4

    .line 569
    :goto_5
    move-object/from16 v0, p0

    move-wide/from16 v1, v28

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v14

    .line 570
    if-nez v26, :cond_e

    if-eqz v16, :cond_e

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v10, 0x0

    cmp-long v4, v4, v10

    if-ltz v4, :cond_e

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v10, 0x7d0

    sub-long/2addr v4, v10

    cmp-long v4, v20, v4

    if-gez v4, :cond_e

    const/4 v4, 0x1

    .line 571
    :goto_6
    if-eqz v16, :cond_8

    if-nez v26, :cond_8

    if-nez v4, :cond_8

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v10, 0x0

    cmp-long v4, v4, v10

    if-ltz v4, :cond_8

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v4, v20, v4

    if-eqz v4, :cond_8

    .line 572
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v4, :cond_f

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v4, :cond_f

    if-eqz v31, :cond_f

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_f

    if-nez v26, :cond_f

    const/4 v4, 0x1

    move/from16 v23, v4

    .line 573
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move/from16 v32, v0

    .line 574
    const-string v4, "previewProgressSource"

    const-string v5, "none"

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 575
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "range"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "media"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "clock"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "none"

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 578
    :cond_9
    const-string v4, "previewObservedAtMs"

    const-wide/16 v10, -0x1

    invoke-virtual {v6, v4, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 579
    const-wide/16 v10, 0x0

    cmp-long v10, v4, v10

    if-gez v10, :cond_10

    const-wide/16 v4, -0x1

    move-wide/from16 v24, v4

    .line 580
    :goto_8
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v4, :cond_12

    .line 581
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mesure="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v20

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ms ; \u00e2ge observation="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-wide/16 v6, 0x0

    cmp-long v4, v24, v6

    if-gez v4, :cond_11

    const-string v4, "inconnu"

    :goto_9
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 582
    const-string v5, " ; source="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ; \u00e9tat page="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ; rejet\u00e9e : arri\u00e8re-plan ; signal audio natif=non lu"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 581
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 559
    :cond_a
    const-string v4, "paused"

    goto/16 :goto_1

    .line 565
    :cond_b
    const/4 v4, 0x0

    move/from16 v16, v4

    goto/16 :goto_3

    .line 566
    :cond_c
    const/4 v4, 0x0

    move/from16 v27, v4

    goto/16 :goto_4

    .line 567
    :cond_d
    const/4 v4, 0x0

    move/from16 v26, v4

    goto/16 :goto_5

    .line 570
    :cond_e
    const/4 v4, 0x0

    goto/16 :goto_6

    .line 572
    :cond_f
    const/4 v4, 0x0

    move/from16 v23, v4

    goto/16 :goto_7

    .line 579
    :cond_10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v4, v10, v4

    move-wide/from16 v24, v4

    goto :goto_8

    .line 581
    :cond_11
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " ms"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_9

    .line 585
    :cond_12
    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_27

    const-wide/high16 v4, 0x7ff8000000000000L    # Double.NaN

    move-wide v10, v4

    .line 586
    :goto_a
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v4, :cond_28

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const-wide/16 v34, 0x0

    cmp-long v4, v4, v34

    if-ltz v4, :cond_28

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v4, v28, v4

    const-wide/16 v34, 0x3e8

    cmp-long v4, v4, v34

    if-ltz v4, :cond_28

    .line 587
    if-eqz v16, :cond_28

    const-wide/16 v4, 0x0

    cmp-long v4, v24, v4

    if-ltz v4, :cond_28

    const-wide/16 v4, 0xbb8

    cmp-long v4, v24, v4

    if-gez v4, :cond_28

    if-eqz v27, :cond_28

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_28

    .line 586
    const/4 v4, 0x1

    move/from16 v22, v4

    .line 591
    :goto_b
    if-eqz v16, :cond_29

    const-wide/16 v4, 0x0

    cmp-long v4, v24, v4

    if-ltz v4, :cond_29

    const-wide/16 v4, 0xbb8

    cmp-long v4, v24, v4

    if-gez v4, :cond_29

    .line 592
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_29

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v4, :cond_29

    if-eqz v27, :cond_29

    if-nez v26, :cond_29

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_29

    if-eqz v31, :cond_29

    .line 593
    const-wide/16 v4, 0x2710

    cmp-long v4, v12, v4

    if-ltz v4, :cond_29

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_29

    const-wide/16 v4, 0xbb8

    sub-long v4, v12, v4

    long-to-double v4, v4

    cmpl-double v4, v14, v4

    if-ltz v4, :cond_29

    const-wide/16 v4, 0xbb8

    .line 591
    cmp-long v4, v20, v4

    if-gtz v4, :cond_29

    const/4 v4, 0x1

    move/from16 v19, v4

    .line 594
    :goto_c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v5, "range"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    const-wide/16 v4, 0x1f40

    .line 595
    :goto_d
    if-nez v16, :cond_2b

    const-string v4, "invalide"

    move-object/from16 v17, v4

    .line 603
    :goto_e
    const-string v4, "\u00e9cart >= seuil"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 604
    const-wide/16 v4, 0x0

    cmpl-double v4, v10, v4

    if-lez v4, :cond_31

    const/4 v4, 0x1

    .line 605
    :goto_f
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    move-wide/from16 v34, v0

    const-wide/16 v36, 0x0

    cmp-long v5, v34, v36

    if-ltz v5, :cond_13

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    move-wide/from16 v34, v0

    sub-long v34, v28, v34

    const-wide/16 v36, 0x1388

    cmp-long v5, v34, v36

    if-gtz v5, :cond_13

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    if-ne v4, v5, :cond_13

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_14

    .line 606
    :cond_13
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 608
    :cond_14
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    .line 609
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v4, :cond_16

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v5, 0x3

    if-lt v4, v5, :cond_16

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    sub-long v4, v28, v4

    const-wide/16 v34, 0x2710

    cmp-long v4, v4, v34

    if-ltz v4, :cond_16

    .line 610
    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    move-wide/from16 v0, v20

    long-to-double v4, v0

    sub-double/2addr v4, v14

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 611
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v4, :cond_15

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 612
    :cond_15
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 613
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "resynchronisation douce ; \u00e9cart r\u00e9p\u00e9t\u00e9="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    double-to-long v0, v10

    move-wide/from16 v34, v0

    move-wide/from16 v0, v34

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 614
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 617
    :cond_16
    :goto_10
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    .line 619
    if-eqz v16, :cond_33

    if-nez v26, :cond_17

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v34, 0x0

    cmp-long v4, v4, v34

    if-ltz v4, :cond_17

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v4, v20, v4

    if-eqz v4, :cond_33

    :cond_17
    const/4 v5, 0x1

    .line 620
    :goto_11
    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 621
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v33, "mesure="

    move-object/from16 v0, v33

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v20

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v33, " ms ; \u00e2ge observation="

    move-object/from16 v0, v33

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-wide/16 v34, 0x0

    cmp-long v4, v24, v34

    if-gez v4, :cond_34

    const-string v4, "inconnu"

    :goto_12
    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 622
    const-string v24, " ; source="

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v24, " ; \u00e9tat page="

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v18, " ; \u00e9cart="

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-static {v10, v11}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_35

    const-string v4, "inconnu"

    :goto_13
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 623
    const-string v10, " ; "

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz v16, :cond_36

    const-string v4, "accept\u00e9e"

    :goto_14
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 621
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 624
    if-eqz v26, :cond_19

    .line 625
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v10, -0x1

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 626
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/high16 v14, 0x7ff8000000000000L    # Double.NaN

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 627
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    const-wide/16 v10, -0x1

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 629
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_19

    :cond_18
    const-wide/16 v10, -0x1

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 631
    :cond_19
    if-eqz v27, :cond_1a

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 632
    :cond_1a
    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1b

    if-eqz v26, :cond_1c

    :cond_1b
    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 635
    :cond_1c
    const-string v4, "previewConfirmPositionMs"

    const-wide/16 v10, -0x1

    invoke-virtual {v6, v4, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 636
    if-eqz v27, :cond_1e

    const-wide/16 v24, 0x0

    cmp-long v4, v10, v24

    if-ltz v4, :cond_1e

    cmp-long v4, v10, v12

    if-gtz v4, :cond_1e

    .line 637
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v4, :cond_1d

    if-nez v26, :cond_1d

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v4, :cond_1d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aget-wide v24, v4, v18

    const-wide/16 v34, 0x0

    cmp-long v4, v24, v34

    if-ltz v4, :cond_1d

    .line 638
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aget-wide v24, v4, v18

    const-wide/16 v34, 0x0

    cmp-long v4, v24, v34

    if-gez v4, :cond_1d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aget-wide v24, v4, v18

    cmp-long v4, v10, v24

    if-eqz v4, :cond_1d

    .line 639
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    move/from16 v18, v0

    aput-wide v28, v4, v18

    .line 640
    :cond_1d
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 642
    :cond_1e
    if-eqz v16, :cond_1f

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-eqz v4, :cond_1f

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_1f

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 643
    :cond_1f
    if-eqz v22, :cond_20

    if-eqz v16, :cond_20

    .line 644
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 645
    const-string v4, "retour confirm\u00e9 par observation coh\u00e9rente ; son non v\u00e9rifi\u00e9"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 647
    :cond_20
    const/4 v4, 0x0

    .line 648
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move/from16 v18, v0

    if-eqz v18, :cond_58

    if-nez v26, :cond_58

    .line 650
    if-eqz v31, :cond_37

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    move-wide/from16 v20, v0

    sub-long v20, v28, v20

    move-wide/from16 v0, v20

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 651
    :goto_15
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    move-wide/from16 v20, v0

    add-long v4, v4, v20

    invoke-static {v12, v13, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 652
    const-wide/16 v20, 0x0

    cmp-long v18, v10, v20

    if-ltz v18, :cond_21

    cmp-long v18, v10, v12

    if-gtz v18, :cond_21

    .line 653
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 655
    :cond_21
    const-wide/16 v20, 0x0

    cmp-long v18, v10, v20

    if-ltz v18, :cond_22

    sub-long v4, v10, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/16 v20, 0x9c4

    cmp-long v4, v4, v20

    if-lez v4, :cond_39

    .line 656
    :cond_22
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v4, :cond_23

    if-nez v31, :cond_23

    move-object/from16 v0, p0

    move-wide/from16 v1, v28

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 657
    :cond_23
    if-eqz v31, :cond_38

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_38

    const/4 v4, 0x1

    :goto_16
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 658
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_25

    if-nez v16, :cond_24

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    :cond_24
    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 659
    :cond_25
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_26

    if-eqz v16, :cond_26

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_26

    .line 660
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_26

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 662
    :cond_26
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto/16 :goto_0

    .line 585
    :cond_27
    move-wide/from16 v0, v20

    long-to-double v4, v0

    sub-double/2addr v4, v14

    move-wide v10, v4

    goto/16 :goto_a

    .line 586
    :cond_28
    const/4 v4, 0x0

    move/from16 v22, v4

    goto/16 :goto_b

    .line 591
    :cond_29
    const/4 v4, 0x0

    move/from16 v19, v4

    goto/16 :goto_c

    .line 594
    :cond_2a
    const-wide/16 v4, 0x1388

    goto/16 :goto_d

    .line 595
    :cond_2b
    const-wide/16 v16, 0x0

    cmp-long v16, v24, v16

    if-gez v16, :cond_2c

    const-string v4, "\u00e2ge inconnu"

    move-object/from16 v17, v4

    goto/16 :goto_e

    .line 596
    :cond_2c
    const-wide/16 v16, 0xbb8

    cmp-long v16, v24, v16

    if-ltz v16, :cond_2d

    const-string v4, "observation ancienne"

    move-object/from16 v17, v4

    goto/16 :goto_e

    .line 597
    :cond_2d
    if-nez v27, :cond_2e

    const-string v4, "identit\u00e9 incompl\u00e8te"

    move-object/from16 v17, v4

    goto/16 :goto_e

    .line 598
    :cond_2e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    move/from16 v16, v0

    if-eqz v16, :cond_2f

    if-nez v22, :cond_2f

    const-string v4, "attente retour 1 s"

    move-object/from16 v17, v4

    goto/16 :goto_e

    .line 599
    :cond_2f
    if-nez v19, :cond_30

    if-nez v22, :cond_30

    if-nez v26, :cond_30

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    move/from16 v16, v0

    if-eqz v16, :cond_30

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move/from16 v16, v0

    if-nez v16, :cond_30

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v16

    if-nez v16, :cond_30

    .line 600
    move-wide/from16 v0, v20

    long-to-double v0, v0

    move-wide/from16 v16, v0

    sub-double v16, v16, v14

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    long-to-double v4, v4

    cmpl-double v4, v16, v4

    if-ltz v4, :cond_30

    const-string v4, "\u00e9cart >= seuil"

    move-object/from16 v17, v4

    goto/16 :goto_e

    :cond_30
    const-string v4, ""

    move-object/from16 v17, v4

    goto/16 :goto_e

    .line 604
    :cond_31
    const/4 v4, -0x1

    goto/16 :goto_f

    .line 616
    :cond_32
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    goto/16 :goto_10

    .line 619
    :cond_33
    const/4 v5, 0x0

    goto/16 :goto_11

    .line 621
    :cond_34
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v24, " ms"

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_12

    .line 622
    :cond_35
    new-instance v4, Ljava/lang/StringBuilder;

    double-to-long v10, v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, " ms"

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_13

    .line 623
    :cond_36
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v11, "rejet\u00e9e : "

    invoke-direct {v4, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_14

    .line 650
    :cond_37
    const-wide/16 v4, 0x0

    goto/16 :goto_15

    .line 657
    :cond_38
    const/4 v4, 0x0

    goto/16 :goto_16

    .line 666
    :cond_39
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v4, :cond_3a

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v28, v4, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v16, "position UI proche de la cible"

    aput-object v16, v4, v5

    .line 667
    :cond_3a
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v20, 0x1

    add-long v4, v4, v20

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const/4 v4, 0x1

    .line 668
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    .line 669
    const-wide/16 v16, -0x1

    move-wide/from16 v0, v16

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-wide/from16 v0, v16

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move/from16 v17, v5

    move/from16 v18, v5

    .line 671
    :goto_17
    if-eqz v18, :cond_53

    .line 672
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 673
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v5, :cond_3b

    if-nez v26, :cond_3b

    if-nez v19, :cond_3b

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 674
    :cond_3b
    long-to-double v4, v10

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 675
    if-eqz v19, :cond_3c

    const-string v4, "retour d\u00e9but observ\u00e9 ; lecture non command\u00e9e"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 691
    :cond_3c
    :goto_18
    if-eqz v17, :cond_3e

    .line 692
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v14, 0x0

    cmp-long v4, v4, v14

    if-ltz v4, :cond_3d

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v14, 0x0

    cmp-long v4, v4, v14

    if-ltz v4, :cond_3d

    if-eqz v31, :cond_3d

    .line 693
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v14, v28, v14

    aput-wide v14, v4, v5

    .line 694
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    rem-int/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 695
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    if-ge v4, v5, :cond_3d

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 697
    :cond_3d
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 699
    :cond_3e
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 700
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v4, :cond_3f

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v4, :cond_3f

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 701
    :cond_3f
    if-eqz v27, :cond_52

    if-eqz v31, :cond_52

    if-nez v23, :cond_52

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_52

    const/4 v4, 0x1

    :goto_19
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 706
    :goto_1a
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_41

    if-nez v18, :cond_40

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_41

    :cond_40
    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 707
    :cond_41
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 708
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_43

    if-eqz v18, :cond_43

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_43

    .line 709
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    .line 710
    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 711
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v4, :cond_42

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v31

    if-ne v0, v4, :cond_42

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v14, 0x1

    add-long/2addr v4, v14

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 712
    :cond_42
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_43

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 714
    :cond_43
    if-eqz v18, :cond_44

    if-eqz v27, :cond_44

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_44

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_44

    move-object/from16 v5, p0

    .line 715
    invoke-direct/range {v5 .. v13}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 716
    :cond_44
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 717
    const-string v4, "apr\u00e8s mesure"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 718
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 719
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_45

    const-string v4, "unknown"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_45

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v31

    if-eq v0, v4, :cond_46

    .line 720
    :cond_45
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 721
    :cond_46
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    goto/16 :goto_0

    .line 676
    :cond_47
    if-eqz v22, :cond_4c

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v5, :cond_4c

    .line 679
    if-eqz v31, :cond_48

    long-to-double v4, v10

    sub-double/2addr v4, v14

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v20, 0x40a7700000000000L    # 3000.0

    cmpl-double v4, v4, v20

    if-gez v4, :cond_48

    const/4 v4, 0x0

    move/from16 v16, v4

    .line 680
    :goto_1b
    if-eqz v16, :cond_49

    long-to-double v4, v10

    :goto_1c
    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    if-eqz v16, :cond_4a

    const-wide/16 v4, 0x0

    :goto_1d
    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 681
    if-eqz v16, :cond_4b

    const-string v4, "retour : saut"

    :goto_1e
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    goto/16 :goto_18

    .line 679
    :cond_48
    const/4 v4, 0x1

    move/from16 v16, v4

    goto :goto_1b

    :cond_49
    move-wide v4, v14

    .line 680
    goto :goto_1c

    :cond_4a
    long-to-double v4, v10

    sub-double/2addr v4, v14

    goto :goto_1d

    .line 681
    :cond_4b
    const-string v4, "retour : correction <=1,25x"

    goto :goto_1e

    .line 682
    :cond_4c
    if-eqz v4, :cond_4d

    if-nez v31, :cond_4d

    .line 683
    const-wide/16 v4, 0x0

    long-to-double v0, v12

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    invoke-static {v0, v1, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v4, v10

    sub-double/2addr v4, v14

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_18

    .line 684
    :cond_4d
    if-eqz v17, :cond_4e

    if-nez v31, :cond_4e

    if-nez v23, :cond_4e

    .line 685
    const-wide/16 v4, 0x0

    long-to-double v0, v12

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    invoke-static {v0, v1, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v14

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_18

    .line 686
    :cond_4e
    if-eqz v17, :cond_4f

    if-nez v23, :cond_4f

    .line 687
    const-wide/16 v4, 0x0

    long-to-double v0, v12

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    invoke-static {v0, v1, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v4, v10

    sub-double/2addr v4, v14

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_18

    .line 688
    :cond_4f
    if-eqz v32, :cond_50

    if-eqz v31, :cond_51

    if-nez v23, :cond_51

    :cond_50
    if-nez v32, :cond_3c

    if-eqz v31, :cond_3c

    .line 689
    :cond_51
    const-wide/16 v4, 0x0

    long-to-double v0, v12

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    invoke-static {v0, v1, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v14

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_18

    .line 701
    :cond_52
    const/4 v4, 0x0

    goto/16 :goto_19

    .line 702
    :cond_53
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_57

    if-nez v26, :cond_57

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_57

    .line 703
    if-eqz v31, :cond_54

    if-eqz v23, :cond_55

    :cond_54
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v4, :cond_55

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 704
    :cond_55
    if-eqz v31, :cond_56

    if-nez v23, :cond_56

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_56

    const/4 v4, 0x1

    :goto_1f
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto/16 :goto_1a

    :cond_56
    const/4 v4, 0x0

    goto :goto_1f

    .line 705
    :cond_57
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1a

    :cond_58
    move/from16 v17, v5

    move/from16 v18, v16

    move-wide/from16 v10, v20

    goto/16 :goto_17

    :cond_59
    move-object/from16 v18, v4

    goto/16 :goto_2
.end method

.method public tapPlayPause()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 732
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 733
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-ltz v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0xbb8

    cmp-long v0, v4, v6

    if-lez v0, :cond_2

    :cond_0
    const/4 v2, -0x1

    .line 747
    :cond_1
    :goto_0
    return v2

    .line 734
    :cond_2
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 735
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    .line 736
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_3

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 737
    :cond_3
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    .line 738
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 739
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 740
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v3, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 746
    const-wide/16 v4, 0x1f40

    .line 740
    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 747
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_1

    move v2, v1

    goto :goto_0

    :cond_4
    move v0, v2

    .line 737
    goto :goto_1
.end method
