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

.field private static final PLAYLIST_STORE:Ljava/lang/String; = "melodix_playlists"

.field private static final PLAY_ICON:I = 0x7f080122

.field private static final RECONCILE_MS:J = 0x1f40L

.field static final SKIP_HOLD_MS:J = 0xfa0L

.field private static final TRACK_VIEWS:[I

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

.field private cacheLoading:Z

.field private cacheOutcome:Ljava/lang/String;

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

.field private firstTracks:I

.field private foreground:Z

.field private foregroundSince:J

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

.field private final pulse:Ljava/lang/Runnable;

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
            "Ljava/lang/ref/WeakReference<",
            "Landroid/webkit/WebView;",
            ">;"
        }
    .end annotation
.end field

.field private serial:J

.field private shownPlaying:Z

.field private shownTracks:I

.field private skipUntil:J

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

.field private final undim:Ljava/lang/Runnable;

.field private valid:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 163
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    .line 164
    const-string v2, ""

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    const-string v2, "unknown"

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    .line 183
    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 853
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->TRACK_VIEWS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f090236
        0x7f09023b
        0x7f090237
        0x7f09023c
        0x7f090244
        0x7f090245
    .end array-data
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 7

    .line 393
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    .line 47
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    .line 48
    new-instance v2, Ljava/lang/ref/WeakReference;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 53
    const/16 v2, 0x8

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    new-array v3, v2, [J

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    .line 56
    new-array v3, v2, [Ljava/lang/String;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    .line 57
    const/4 v2, -0x1

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 58
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    .line 139
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 140
    const-string v3, "\u2014"

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v4, "Temps restant : \u2014"

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 142
    const-string v4, ""

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 143
    const-string v5, "none"

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 147
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v6, "unknown"

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 148
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 149
    const/16 v6, 0x78

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 151
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 152
    const/16 v6, 0x14

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    .line 154
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    .line 157
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    .line 159
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 174
    const/4 v5, 0x2

    new-array v6, v5, [Landroid/animation/ObjectAnimator;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 175
    new-array v5, v5, [Landroid/graphics/drawable/Drawable;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 177
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 178
    const/16 v5, 0x3c

    new-array v5, v5, [J

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 181
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 185
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 196
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 197
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 198
    const-string v3, "non observ\u00e9e"

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 211
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 212
    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    .line 226
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 227
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    .line 228
    const-string v2, "non charg\u00e9"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    .line 438
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 562
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    .line 852
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    .line 858
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$6;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$6;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    .line 394
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 395
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz p1, :cond_0

    .line 396
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 397
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 398
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 399
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 400
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 401
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 402
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 404
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    return-object p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerController;)[J
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    return-object p0
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    return-wide v0
.end method

.method static synthetic access$1202(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    return-wide p1
.end method

.method static synthetic access$1302(Lcom/melodix/music/PreviewPlayerController;D)D
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    return-wide p1
.end method

.method static synthetic access$1402(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return p0
.end method

.method static synthetic access$1502(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method static synthetic access$1700(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$1902(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    return p1
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$2002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2084(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    return p0
.end method

.method static synthetic access$2202(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    return-wide p1
.end method

.method static synthetic access$2300(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    return-wide v0
.end method

.method static synthetic access$2402(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    return p1
.end method

.method static synthetic access$2502(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    return p1
.end method

.method static synthetic access$2602(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    return p1
.end method

.method static synthetic access$2702(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    return p1
.end method

.method static synthetic access$2800(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return p0
.end method

.method static synthetic access$2802(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return p1
.end method

.method static synthetic access$2902(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return p1
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$3002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3102(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3202(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    return-wide p1
.end method

.method static synthetic access$3302(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3402(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    return-wide p1
.end method

.method static synthetic access$3502(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    return-wide p1
.end method

.method static synthetic access$3602(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    return-wide p1
.end method

.method static synthetic access$3700(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$3800(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method static synthetic access$3900(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    return-void
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return p0
.end method

.method static synthetic access$4000(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return p0
.end method

.method static synthetic access$4002(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return p1
.end method

.method static synthetic access$402(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return p1
.end method

.method static synthetic access$4100(Lcom/melodix/music/PreviewPlayerController;)Landroid/os/Handler;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$4200(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$4302(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    return-wide p1
.end method

.method static synthetic access$4400(Lcom/melodix/music/PreviewPlayerController;F)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    return-void
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$702(Lcom/melodix/music/PreviewPlayerController;D)D
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    return-wide p1
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-wide v0
.end method

.method static synthetic access$802(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    return-wide p1
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    return-wide v0
.end method

.method public static cachedRows(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 337
    :try_start_0
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    const-string v0, "melodix_playlists"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 339
    if-nez p0, :cond_1

    return-object p2

    .line 340
    :cond_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_2

    return-object p2

    .line 341
    :cond_2
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 342
    const-string v0, "title"

    const-string v1, "Copie enregistr\u00e9e"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "subtitle"

    const-string v1, "Actualisation des titres en cours\u2026"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "settingValue"

    const-string v1, "Info"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 343
    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 337
    :cond_3
    :goto_0
    return-object p2

    .line 344
    :catch_0
    move-exception p0

    return-object p2
.end method

.method private cancelSeek()V
    .locals 4

    .line 76
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_0

    const-string v0, "annul\u00e9 (identit\u00e9 chang\u00e9e ou invalide)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 77
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 78
    return-void
.end method

.method private static clock(J)Ljava/lang/String;
    .locals 8

    .line 428
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

    .line 429
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

    .line 588
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

    .line 589
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

    .line 865
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

.method private dimTrack(F)V
    .locals 5

    .line 855
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 856
    :cond_0
    sget-object v1, Lcom/melodix/music/PreviewPlayerController;->TRACK_VIEWS:[I

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget v4, v1, v3

    invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v4, p1}, Landroid/view/View;->setAlpha(F)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 857
    :cond_2
    return-void
.end method

.method private dominantPhase()Ljava/lang/String;
    .locals 18

    .line 883
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

    .line 885
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

    .line 886
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

    .line 887
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

    .line 888
    nop

    .line 889
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

    .line 890
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

    .line 884
    :cond_5
    :goto_3
    const-string v1, "ind\u00e9termin\u00e9e (phases manquantes ou non s\u00e9quentielles)"

    return-object v1
.end method

.method private freezeForBackground(Ljava/lang/String;)V
    .locals 7

    .line 482
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 483
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 484
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v3

    .line 485
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-nez v5, :cond_0

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 486
    :cond_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    .line 487
    const-string v1, "interrupted"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v0, v5

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 488
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 489
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

    .line 490
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

    .line 489
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 491
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 492
    return-void
.end method

.method private now()J
    .locals 2

    .line 412
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 2

    .line 879
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

.method static playlistKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 331
    if-eqz p0, :cond_1

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/collection/tracks"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    return-object v0

    .line 332
    :cond_1
    const-string v0, "(?:spotify:playlist:|/playlist/)([A-Za-z0-9]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v1, ""

    if-nez p0, :cond_2

    move-object p0, v1

    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 333
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "spotify:playlist:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_3
    return-object v1
.end method

.method private position(J)D
    .locals 1

    .line 414
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

    .line 417
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_0

    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1

    .line 418
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_1

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    return-wide p1

    .line 419
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 420
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_2

    move-wide v0, p1

    .line 423
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

    .line 424
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    long-to-double p1, p1

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    mul-double/2addr v6, p1

    .line 425
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

    .line 867
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const-string v0, "lecture interrompue au d\u00e9part ; audio non v\u00e9rifi\u00e9"

    return-object v0

    .line 868
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const-string v0, "\u00e9tat du lecteur indisponible"

    return-object v0

    .line 869
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_2

    const-string v0, "pause demand\u00e9e"

    return-object v0

    .line 870
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    return-object v0

    .line 871
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "lecture en pause"

    return-object v0

    .line 872
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_5

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    return-object v0

    .line 873
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_6

    const-string v0, "position ou dur\u00e9e indisponible"

    return-object v0

    .line 874
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_7

    const-string v0, "mouvement arr\u00eat\u00e9"

    return-object v0

    .line 875
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

    .line 876
    :cond_8
    const-string v0, "animation active"

    return-object v0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .line 611
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

    .line 612
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 613
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

    .line 611
    :goto_0
    return p0
.end method

.method private recordReturn(Ljava/lang/String;)V
    .locals 7

    .line 166
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 167
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

    .line 168
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

    .line 169
    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    add-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v0, v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    .line 170
    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_1

    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    .line 171
    :cond_1
    return-void
.end method

.method private renderButtons()V
    .locals 5

    .line 575
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_a

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 578
    :cond_0
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    const-string v2, "unknown"

    const v3, 0x7f080122

    const v4, 0x7f080121

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eqz v1, :cond_2

    move v3, v4

    goto :goto_0

    .line 579
    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    move v3, v4

    .line 580
    :cond_2
    :goto_0
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eqz v1, :cond_3

    const-string v1, "Lecture demand\u00e9e, en attente"

    goto :goto_2

    :cond_3
    const-string v1, "Pause demand\u00e9e, en attente"

    goto :goto_2

    .line 581
    :cond_4
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    .line 582
    :cond_5
    if-ne v3, v4, :cond_6

    const-string v1, "Mettre en pause"

    goto :goto_2

    :cond_6
    const-string v1, "Lire"

    goto :goto_2

    .line 581
    :cond_7
    :goto_1
    const-string v1, "\u00c9tat de lecture inconnu"

    .line 583
    :goto_2
    const v2, 0x7f090238

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v4, 0x7f09023e

    invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 584
    instance-of v4, v2, Landroid/widget/ImageView;

    if-eqz v4, :cond_8

    move-object v4, v2

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 585
    :cond_8
    instance-of v2, v0, Landroid/widget/ImageView;

    if-eqz v2, :cond_9

    move-object v2, v0

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 586
    :cond_9
    return-void

    .line 575
    :cond_a
    :goto_3
    return-void
.end method

.method private renderProgress()V
    .locals 17

    .line 446
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return-void

    .line 447
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 448
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

    .line 449
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

    .line 450
    const-string v2, "-:--"

    invoke-direct {v0, v1, v13, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    invoke-direct {v0, v1, v12, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 451
    const/4 v2, 0x0

    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    invoke-direct {v0, v1, v10, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 452
    invoke-virtual {v1, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 453
    if-nez v1, :cond_2

    const/4 v7, 0x0

    goto :goto_0

    :cond_2
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 454
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

    .line 455
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 456
    :cond_3
    return-void

    .line 458
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 459
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    double-to-long v14, v14

    move-object/from16 v16, v8

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v7, v14

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 460
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v9, 0x3e8

    div-long v4, v14, v9

    cmp-long v12, v12, v4

    if-eqz v12, :cond_5

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v14, v15}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 461
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

    .line 462
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

    .line 463
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

    .line 464
    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v3, 0x7f09023d

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 465
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const v3, 0x7f09024a

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const v3, 0x7f09024b

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 466
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 467
    if-nez v1, :cond_8

    const/4 v7, 0x0

    goto :goto_1

    :cond_8
    move-object/from16 v2, v16

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 468
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

    .line 469
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 470
    :cond_9
    return-void
.end method

.method private report()Ljava/lang/String;
    .locals 16

    .line 893
    move-object/from16 v0, p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 894
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

    .line 895
    const-string v2, "\nInterface optimiste : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 896
    const-string v2, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 897
    const-string v2, "\nInterface confirm\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 898
    const-string v2, "\nCache local : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ; \u00e9criture : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->writeStatus()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 899
    const-string v2, "\nCache local : lecture et application \u00e9ventuelle des vues, sans mesure de frame : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    cmp-long v3, v6, v4

    const-string v6, " ms"

    const-string v7, "\u2014"

    if-gez v3, :cond_1

    move-object v3, v7

    goto :goto_1

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    invoke-virtual {v3, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 900
    const-string v2, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 901
    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_2

    move-object v3, v7

    goto :goto_2

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 902
    const-string v2, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 903
    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_3

    move-object v3, v7

    goto :goto_3

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 904
    const-string v2, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 905
    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_4

    move-object v3, v7

    goto :goto_4

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 906
    const-string v2, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 907
    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    cmp-long v3, v8, v4

    if-gez v3, :cond_5

    move-object v3, v7

    goto :goto_5

    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 908
    const-string v3, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 909
    const-string v2, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 910
    const-string v2, "\nSource position : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 911
    const-string v2, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    const-string v8, "oui"

    const-string v9, "non"

    if-eqz v3, :cond_6

    move-object v3, v8

    goto :goto_6

    :cond_6
    move-object v3, v9

    :goto_6
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 912
    const-string v2, "\nAnimation barre : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 913
    const-string v2, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_7

    goto :goto_7

    :cond_7
    move-object v8, v9

    :goto_7
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 914
    const-string v2, " ; \u00e9tat : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 915
    const-string v2, " ; \u00e2ge de la mesure : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v3, v10, v4

    if-gez v3, :cond_8

    move-object v3, v7

    goto :goto_8

    :cond_8
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

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_8
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 916
    const-string v2, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 917
    const-string v2, " ; appui \u2192 navigation : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 918
    const-string v2, " ; titres affich\u00e9s : premi\u00e8re liste="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez v3, :cond_9

    move-object v3, v7

    goto :goto_9

    :cond_9
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    :goto_9
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", derni\u00e8re="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    if-gez v3, :cond_a

    move-object v3, v7

    goto :goto_a

    :cond_a
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    :goto_a
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 919
    const-string v2, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 920
    const-string v2, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v3, v10, v4

    if-ltz v3, :cond_b

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    goto :goto_b

    :cond_b
    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    :goto_b
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 921
    const-string v2, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 922
    const-string v2, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {v0, v10, v11, v12, v13}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 923
    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v2, :cond_d

    const-string v2, "\nLik\u00e9s : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 924
    const-string v3, " ; rendu natif : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v3, v10, v4

    if-gez v3, :cond_c

    const-string v3, "non observ\u00e9"

    goto :goto_c

    :cond_c
    const-string v3, "lignes visibles"

    :goto_c
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 925
    :cond_d
    const-string v2, "\nPhase dominante : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 926
    const-string v2, " ; waiting-bridge avec lignes : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v3, v10, v4

    if-gez v3, :cond_e

    const-string v9, "ind\u00e9termin\u00e9"

    goto :goto_d

    :cond_e
    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v8, "waiting-bridge"

    invoke-virtual {v3, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_f

    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v3, :cond_10

    :cond_f
    const-string v9, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    :cond_10
    :goto_d
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 927
    const-string v2, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 928
    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v2, :cond_11

    const-string v2, " aucun"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 929
    :cond_11
    const/4 v3, 0x0

    :goto_e
    iget v8, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-ge v3, v8, :cond_13

    .line 930
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

    .line 931
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

    .line 932
    invoke-direct {v0, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 933
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

    .line 934
    const-string v10, " ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v11, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v11, v11, v8

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ")"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 935
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

    .line 936
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

    .line 937
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v3, v3, v8

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 938
    const-string v2, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 939
    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v4, v3, v8

    const-wide/16 v9, 0x0

    cmp-long v3, v4, v9

    if-gez v3, :cond_12

    move-object v3, v7

    goto :goto_f

    :cond_12
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v8, v4, v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_f
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 929
    add-int/lit8 v3, v15, 0x1

    const-wide/16 v4, 0x0

    goto/16 :goto_e

    .line 941
    :cond_13
    const-string v2, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 942
    const-string v2, "\nIntervalles position : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 943
    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v2, :cond_14

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 944
    :cond_14
    const/4 v2, 0x0

    :goto_10
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-ge v2, v3, :cond_16

    .line 945
    if-lez v2, :cond_15

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 946
    :cond_15
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

    .line 947
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v3, v4, v3

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 944
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 949
    :cond_16
    const-string v2, "\nRetour \u2014 absence : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    const-wide/16 v7, 0x0

    cmp-long v3, v3, v7

    if-gez v3, :cond_17

    const-string v3, "inconnue"

    goto :goto_11

    :cond_17
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_11
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 950
    const-string v2, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 951
    const-string v2, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 952
    const/4 v2, 0x0

    :goto_12
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    const-string v4, "\n"

    if-ge v2, v3, :cond_18

    .line 953
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

    .line 954
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v3, v5, v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 952
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 956
    :cond_18
    const-string v2, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 957
    const/4 v2, 0x0

    :goto_13
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    if-ge v2, v3, :cond_19

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 958
    :cond_19
    const-string v2, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 959
    const/4 v2, 0x0

    :goto_14
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-ge v2, v3, :cond_1a

    .line 960
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

    .line 961
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v3, v6, v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 959
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 963
    :cond_1a
    const-string v2, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 964
    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticReport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 965
    invoke-static {}, Lcom/melodix/music/PreviewPlayerVolume;->diagnosticReport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 966
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->diagnosticReport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 967
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private resetDivergence()V
    .locals 2

    .line 493
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
    .locals 3

    .line 440
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 441
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 442
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v2, ","

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 443
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    .line 442
    :goto_0
    return v1
.end method

.method private saveInProcess()V
    .locals 2

    .line 406
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 407
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    .line 408
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 409
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 410
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

    .line 411
    return-void
.end method

.method private saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 7

    .line 294
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_7

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v1, :cond_7

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v1, :cond_7

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v1, :cond_7

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 295
    :cond_0
    const-string v1, "previewObservedAtMs"

    const-wide/16 v2, -0x1

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v3

    .line 296
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p7, p8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 297
    new-instance v6, Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-direct {v6}, Lcom/melodix/music/PreviewLastTrackStore$Record;-><init>()V

    .line 298
    iput-object p2, v6, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    iput-object p3, v6, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    iput-object p4, v6, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    iput-wide p5, v6, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    iput-wide p7, v6, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    iput-wide v1, v6, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    .line 299
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-static {v6, p2, p3}, Lcom/melodix/music/PreviewLastTrackStore;->valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z

    move-result p2

    if-nez p2, :cond_1

    return-void

    .line 300
    :cond_1
    const p2, 0x7f090244

    invoke-virtual {v0, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 301
    const-string p3, "cover"

    const-string p5, ""

    invoke-virtual {p1, p3, p5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    instance-of p1, p2, Landroid/widget/ImageView;

    if-eqz p1, :cond_2

    .line 302
    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 303
    instance-of p2, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz p2, :cond_2

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    .line 305
    :cond_2
    const/4 p1, 0x0

    :goto_0
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    .line 306
    if-eqz p2, :cond_4

    iget-object p3, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    iget-wide p5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    const-wide/16 p7, 0x0

    cmp-long p3, p5, p7

    if-ltz p3, :cond_4

    iget-wide p5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    sub-long p5, v3, p5

    const-wide/16 p7, 0x1388

    cmp-long p3, p5, p7

    if-gez p3, :cond_4

    if-eqz p1, :cond_3

    iget-boolean p3, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    if-eqz p3, :cond_4

    .line 307
    :cond_3
    return-void

    .line 308
    :cond_4
    if-nez p1, :cond_6

    if-eqz p2, :cond_5

    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    if-eqz p2, :cond_5

    goto :goto_1

    :cond_5
    const/4 p2, 0x0

    goto :goto_2

    :cond_6
    :goto_1
    const/4 p2, 0x1

    :goto_2
    iput-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    .line 309
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 310
    invoke-static {v0, v6, p1}, Lcom/melodix/music/PreviewLastTrackStore;->save(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V

    .line 311
    return-void

    .line 294
    :cond_7
    :goto_3
    return-void
.end method

.method private scheduleFrame()V
    .locals 2

    .line 592
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

    .line 593
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 3

    .line 502
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 503
    :cond_0
    return-void
.end method

.method private seekDiagFinish(Ljava/lang/String;)V
    .locals 5

    .line 60
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

    .line 61
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-object p1, v0, v1

    .line 62
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 1

    .line 472
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 473
    instance-of p2, p1, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_1

    .line 474
    check-cast p1, Landroid/widget/ProgressBar;

    .line 475
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    move-result p2

    const/16 v0, 0x3e8

    if-eq p2, v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 476
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p2

    if-eq p2, p3, :cond_1

    invoke-virtual {p1, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 478
    :cond_1
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .line 528
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v0, p1

    .line 529
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

    .line 530
    :cond_1
    return-void
.end method

.method static storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 6

    .line 347
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 348
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 349
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 350
    :cond_0
    const-string v3, "id"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "uri"

    invoke-virtual {v2, v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 351
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "title"

    invoke-virtual {v2, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Copie enregistr\u00e9e|Aper\u00e7u pr\u00e9charg\u00e9"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    .line 352
    :cond_1
    const-string v4, "(?i)^spotify:track:[a-z0-9]+$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v4, 0x12c

    if-ge v3, v4, :cond_2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 348
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 354
    :cond_3
    return-object v0
.end method

.method private storeRows(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 11

    .line 357
    const-string v0, "#t"

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 358
    if-eqz v1, :cond_7

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto/16 :goto_4

    .line 359
    :cond_0
    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-nez p2, :cond_1

    return-void

    .line 361
    :cond_1
    :try_start_0
    const-string p2, "melodix_playlists"

    const/4 v3, 0x0

    invoke-virtual {v1, p2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    .line 362
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {p1, v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 363
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 364
    invoke-interface {p2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 365
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/16 v4, 0x1e

    if-lt v2, v4, :cond_6

    .line 366
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 367
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-wide/16 v7, 0x0

    invoke-interface {p2, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    cmp-long v6, v9, v6

    if-gez v6, :cond_4

    move-object v2, v5

    goto :goto_2

    .line 368
    :cond_5
    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-interface {p1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 369
    goto :goto_1

    .line 370
    :cond_6
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 371
    :catch_0
    move-exception p1

    :goto_3
    nop

    .line 372
    return-void

    .line 358
    :cond_7
    :goto_4
    return-void
.end method

.method private syncGlow()V
    .locals 8

    .line 532
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 533
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

    .line 534
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v5

    .line 535
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

    .line 536
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

    .line 537
    :goto_2
    const v1, 0x7f09024d

    const v2, 0x7f09023d

    filled-new-array {v1, v2}, [I

    move-result-object v1

    .line 538
    nop

    :goto_3
    const/4 v2, 0x2

    if-ge v3, v2, :cond_7

    .line 539
    const/4 v5, 0x0

    if-nez v0, :cond_3

    move-object v6, v5

    goto :goto_4

    :cond_3
    aget v6, v1, v3

    invoke-virtual {v0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 540
    :goto_4
    nop

    .line 541
    if-eqz v4, :cond_4

    instance-of v7, v6, Landroid/widget/ProgressBar;

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 542
    check-cast v6, Landroid/widget/ProgressBar;

    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 543
    instance-of v7, v6, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v7, :cond_4

    .line 544
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 545
    check-cast v6, Landroid/graphics/drawable/LayerDrawable;

    const v5, 0x102000d

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 548
    :cond_4
    if-nez v5, :cond_5

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    goto :goto_5

    .line 549
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

    .line 550
    :cond_6
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 551
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v5, v6, v3

    .line 552
    const/16 v6, 0x96

    const/16 v7, 0xff

    filled-new-array {v6, v7}, [I

    move-result-object v6

    const-string v7, "alpha"

    invoke-static {v5, v7, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 553
    const-wide/16 v6, 0x640

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 554
    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 555
    const/4 v2, -0x1

    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 556
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v5, v2, v3

    .line 557
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 538
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 559
    :cond_7
    return-void
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 432
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 433
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 434
    :cond_0
    return-void
.end method


# virtual methods
.method public acceptPlayerPayload(Ljava/lang/String;)Z
    .locals 18

    .line 273
    move-object/from16 v1, p0

    const-string v0, ""

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    const/4 v3, 0x1

    if-nez v2, :cond_0

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-nez v2, :cond_0

    return v3

    .line 274
    :cond_0
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    const/4 v4, 0x0

    if-nez v2, :cond_1

    return v4

    .line 276
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    move-object/from16 v5, p1

    invoke-direct {v2, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 277
    const-string v5, "track"

    invoke-virtual {v2, v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "artist"

    invoke-virtual {v2, v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "previewPlaybackState"

    const-string v7, "unknown"

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 278
    const-string v7, "previewPositionMs"

    const-wide/16 v8, -0x1

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-string v7, "previewDurationMs"

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 279
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-string v7, "previewObservedAtMs"

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v16

    sub-long v14, v14, v16

    .line 280
    const-string v7, "previewProgressValid"

    invoke-virtual {v2, v7, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-wide/16 v16, 0x0

    cmp-long v0, v12, v16

    if-lez v0, :cond_6

    cmp-long v0, v10, v16

    if-ltz v0, :cond_6

    cmp-long v0, v10, v12

    if-gtz v0, :cond_6

    cmp-long v0, v14, v16

    if-ltz v0, :cond_6

    const-wide/16 v10, 0xbb8

    cmp-long v0, v14, v10

    if-gez v0, :cond_6

    const-string v0, "playing"

    .line 282
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "paused"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_3

    .line 283
    :cond_2
    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 284
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v0, :cond_5

    .line 285
    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 286
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v2, 0x0

    if-nez v0, :cond_3

    move-object v0, v2

    goto :goto_0

    :cond_3
    const v5, 0x7f09023a

    invoke-virtual {v0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 287
    :goto_0
    if-nez v0, :cond_4

    :goto_1
    goto :goto_2

    :cond_4
    const-string v2, "previewPlayerDragHandle"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    goto :goto_1

    .line 288
    :goto_2
    instance-of v0, v2, Landroid/widget/TextView;

    if-eqz v0, :cond_5

    check-cast v2, Landroid/widget/TextView;

    const-string v0, "LECTURE EN COURS"

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    :cond_5
    return v3

    .line 282
    :cond_6
    :goto_3
    return v4

    .line 291
    :catch_0
    move-exception v0

    return v4
.end method

.method public activityCreated()V
    .locals 4

    .line 214
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    return-void

    .line 215
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 218
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_2

    .line 220
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 221
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

    .line 222
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :cond_1
    :goto_0
    nop

    .line 224
    :cond_2
    return-void
.end method

.method public activityPaused()V
    .locals 1

    .line 480
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 6

    .line 495
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 496
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

    .line 497
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 498
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 499
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

    .line 500
    return-void
.end method

.method public activityStarted()V
    .locals 1

    .line 479
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 1

    .line 523
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    const-string v0, "onStop (sans onPause observ\u00e9)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    .line 524
    :cond_0
    const-string v0, "onStop ; position fig\u00e9e ; signal audio natif=non lu (incertain)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 525
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 526
    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .line 861
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$7;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$7;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 864
    return-void
.end method

.method public attachSeek(Landroid/webkit/WebView;)V
    .locals 1

    .line 64
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    .line 65
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

    .line 66
    :goto_0
    instance-of v0, p1, Landroid/widget/SeekBar;

    if-eqz v0, :cond_1

    .line 67
    move-object v0, p1

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 68
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 70
    :cond_1
    return-void
.end method

.method public begin(I)V
    .locals 6

    .line 841
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 842
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 845
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    :cond_0
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz p1, :cond_1

    .line 846
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v2, 0xfa0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 847
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    const p1, 0x3ee66666    # 0.45f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 848
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 850
    :cond_1
    return-void
.end method

.method public clearLastTrack()V
    .locals 2

    .line 313
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/melodix/music/PreviewLastTrackStore;->clear(Landroid/content/Context;)V

    .line 314
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 315
    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 316
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 317
    return-void
.end method

.method public command()V
    .locals 4

    .line 859
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

    .line 595
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 596
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    .line 597
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 598
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    const-wide/16 v2, 0x0

    if-eqz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    .line 599
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 600
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v0

    if-gtz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v4, v0, v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 602
    :cond_1
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz p2, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_2

    .line 603
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 605
    :cond_2
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 606
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_3

    return-void

    .line 607
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 608
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

    .line 609
    :cond_6
    return-void
.end method

.method public layoutReady()V
    .locals 3

    .line 231
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 232
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    .line 233
    new-instance v1, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewLastTrackStore;->load(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Callback;)V

    .line 270
    return-void
.end method

.method public loadState(Ljava/lang/String;)V
    .locals 4

    .line 188
    if-eqz p1, :cond_3

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 189
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 190
    const-string v0, "waiting-bridge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 191
    :cond_1
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    return-void

    .line 193
    :cond_2
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 194
    return-void

    .line 188
    :cond_3
    :goto_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .line 92
    if-eqz p3, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_0

    goto :goto_0

    .line 93
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

    .line 94
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 95
    return-void

    .line 92
    :cond_1
    :goto_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 12

    .line 80
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz p1, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_2

    .line 81
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v4

    double-to-long v4, v4

    .line 82
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz p1, :cond_1

    .line 83
    const-string p1, "remplac\u00e9 par un nouveau geste"

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->seekDiagFinish(Ljava/lang/String;)V

    .line 84
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 85
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

    .line 86
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 88
    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    .line 90
    :cond_2
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 15

    .line 97
    move-object v0, p0

    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void

    .line 98
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    .line 99
    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_5

    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v1, :cond_1

    goto/16 :goto_2

    .line 100
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 101
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v5, v5

    rem-int/2addr v3, v5

    iput v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    .line 102
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v5, v5

    if-ge v3, v5, :cond_2

    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    add-int/2addr v3, v4

    iput v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    .line 103
    :cond_2
    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSequence:J

    .line 104
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aput-wide v5, v9, v3

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aput-wide v1, v9, v3

    .line 105
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    iget-object v11, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    const-wide/16 v13, -0x1

    aput-wide v13, v12, v3

    aput-wide v13, v11, v3

    aput-wide v13, v10, v3

    aput-wide v13, v9, v3

    .line 106
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

    .line 107
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    aput-wide v10, v9, v3

    .line 108
    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v10, "en attente"

    aput-object v10, v9, v3

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aput-object v10, v9, v3

    .line 109
    invoke-direct {p0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v9

    double-to-long v9, v9

    iput-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 110
    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    add-long/2addr v9, v7

    iput-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 111
    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    long-to-double v7, v7

    iput-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 112
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v2, "playing"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 113
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 114
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    .line 115
    if-eqz v1, :cond_4

    .line 116
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

    .line 117
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

    .line 118
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v7

    aput-wide v7, v4, v3

    .line 119
    new-instance v4, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v4, p0, v3, v5, v6}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    invoke-virtual {v1, v2, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 127
    goto :goto_1

    :cond_4
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    const-string v2, "WebView indisponible"

    aput-object v2, v1, v3

    .line 128
    :goto_1
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v2, p0, v9, v10}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v3, 0x1388

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 137
    return-void

    .line 99
    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 72
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 p2, 0x3

    const/4 v0, 0x0

    if-ne p1, p2, :cond_0

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    if-eqz p1, :cond_0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 73
    :cond_0
    return v0
.end method

.method public phase(Ljava/lang/String;)V
    .locals 7

    .line 200
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_8

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 201
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 202
    const-string v4, "rows-received"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    goto/16 :goto_0

    .line 203
    :cond_1
    const-string v4, "liked-route-other"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string p1, "page diff\u00e9rente"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 204
    :cond_2
    const-string v4, "liked-dom-empty"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string p1, "page lik\u00e9s vue, aucune ligne DOM observ\u00e9e"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 205
    :cond_3
    const-string v4, "liked-dom-rows"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string p1, "page lik\u00e9s vue, lignes DOM pr\u00e9sentes"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 206
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

    .line 207
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

    .line 208
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

    .line 209
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    .line 210
    :cond_7
    :goto_0
    return-void

    .line 200
    :cond_8
    :goto_1
    return-void
.end method

.method public playlistOpened(Ljava/lang/String;)V
    .locals 4

    .line 319
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 320
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

    .line 321
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v0, "non observ\u00e9e"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 322
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 323
    if-eqz p1, :cond_2

    const-string v1, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 324
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 326
    :cond_2
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 374
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

    .line 375
    :cond_0
    const-string v0, "detail"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    if-eqz p2, :cond_1

    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p2, v4}, Lcom/melodix/music/PreviewPlayerController;->storeRows(Ljava/lang/String;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    .line 376
    :cond_1
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p1, v4, v2

    if-ltz p1, :cond_6

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 378
    :try_start_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 379
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-lez p2, :cond_2

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    iget p3, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez p3, :cond_2

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    .line 380
    :cond_2
    const/4 p2, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-ge p2, p3, :cond_5

    .line 381
    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p3

    .line 382
    if-eqz p3, :cond_4

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

    if-eqz p3, :cond_4

    .line 383
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long p1, p1, v2

    if-gez p1, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 384
    :cond_3
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 385
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 380
    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 388
    :catch_1
    move-exception p1

    :cond_5
    :goto_2
    nop

    .line 390
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 391
    return-void
.end method

.method public run()V
    .locals 12

    .line 505
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 506
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 507
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 508
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 509
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

    .line 510
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

    .line 511
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

    .line 512
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v6

    .line 513
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

    .line 514
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 515
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

    .line 516
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

    .line 518
    :cond_5
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 519
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_6

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 520
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 521
    return-void

    .line 506
    :cond_7
    :goto_3
    return-void
.end method

.method public showDiagnostics()V
    .locals 4

    .line 970
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 971
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 972
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$8;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$8;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    .line 973
    const-string v0, "Copier"

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 978
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 979
    return-void
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 47

    .line 617
    move-object/from16 v10, p0

    const-string v0, "range"

    const-string v1, "none"

    const-string v2, "previewPlaybackState"

    const-string v3, "previewProgressValid"

    const-string v4, "playing"

    const/4 v13, 0x0

    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    move-object/from16 v6, p1

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 618
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    .line 619
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v7, "artist"

    const-string v8, "track"

    const-string v9, ""

    const-wide/16 v11, -0x1

    if-nez v6, :cond_3

    .line 620
    :try_start_1
    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    const-string v0, "callback legacy ignor\u00e9 en arri\u00e8re-plan"

    invoke-direct {v10, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void

    .line 624
    :cond_0
    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 627
    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_2

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v10, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 628
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    iput-boolean v13, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v13, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v13, v10, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v13, v10, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 629
    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 631
    :cond_2
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 632
    return-void

    .line 634
    :cond_3
    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 635
    const-string v8, "previewTrackUri"

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 636
    const-string v13, "previewPositionMs"

    move-object/from16 v16, v8

    move-object/from16 p1, v9

    invoke-virtual {v5, v13, v11, v12}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    const-string v13, "previewDurationMs"

    move-object/from16 v17, v0

    move-object/from16 v18, v1

    invoke-virtual {v5, v13, v11, v12}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 637
    const/4 v13, 0x0

    invoke-virtual {v5, v4, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v19
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v13, "paused"

    if-eqz v19, :cond_4

    move-object v11, v4

    goto :goto_0

    :cond_4
    move-object v11, v13

    :goto_0
    :try_start_2
    invoke-virtual {v5, v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 638
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-wide/from16 v20, v14

    const-string v14, "unknown"

    if-nez v12, :cond_5

    :try_start_3
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_5

    move-object v11, v14

    .line 640
    :cond_5
    invoke-virtual {v5, v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 641
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    move-object v2, v14

    .line 642
    :cond_6
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    .line 643
    const/4 v4, 0x0

    invoke-virtual {v5, v3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    move-object v15, v14

    const-wide/16 v13, 0x0

    if-eqz v3, :cond_7

    cmp-long v3, v0, v13

    if-lez v3, :cond_7

    cmp-long v3, v8, v13

    if-ltz v3, :cond_7

    cmp-long v3, v8, v0

    if-gtz v3, :cond_7

    const/4 v3, 0x1

    goto :goto_1

    :cond_7
    const/4 v3, 0x0

    .line 644
    :goto_1
    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-static {v7}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    cmp-long v4, v0, v13

    if-lez v4, :cond_8

    const/4 v4, 0x1

    goto :goto_2

    :cond_8
    const/4 v4, 0x0

    .line 645
    :goto_2
    if-eqz v4, :cond_a

    iget-boolean v13, v10, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v13, :cond_9

    iget-object v13, v10, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v13, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    iget-object v13, v10, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 646
    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    iget-wide v13, v10, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v13, v13, v0

    if-eqz v13, :cond_a

    :cond_9
    const/4 v13, 0x1

    goto :goto_3

    :cond_a
    const/4 v13, 0x0

    .line 647
    :goto_3
    move-object/from16 v24, v15

    iget-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    cmp-long v14, v14, v20

    if-lez v14, :cond_c

    .line 649
    if-eqz v13, :cond_b

    const-wide/16 v14, -0x1

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    iget-object v14, v10, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v15, v10, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {v14, v15}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v10, v14}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    goto :goto_4

    .line 650
    :cond_b
    if-eqz v4, :cond_c

    return-void

    .line 652
    :cond_c
    :goto_4
    move-wide/from16 v14, v20

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    invoke-direct {v10, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v6

    .line 653
    if-nez v13, :cond_d

    if-eqz v3, :cond_d

    move-wide/from16 v25, v0

    iget-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v22, 0x0

    cmp-long v0, v0, v22

    if-ltz v0, :cond_e

    iget-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v27, 0x7d0

    sub-long v0, v0, v27

    cmp-long v0, v8, v0

    if-gez v0, :cond_e

    const/4 v0, 0x1

    goto :goto_5

    :cond_d
    move-wide/from16 v25, v0

    :cond_e
    const/4 v0, 0x0

    .line 654
    :goto_5
    if-eqz v3, :cond_f

    if-nez v13, :cond_f

    if-nez v0, :cond_f

    iget-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v22, 0x0

    cmp-long v0, v0, v22

    if-ltz v0, :cond_f

    iget-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v0, v8, v0

    if-eqz v0, :cond_f

    .line 655
    :cond_f
    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_10

    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_10

    if-eqz v12, :cond_10

    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_10

    if-nez v13, :cond_10

    const/4 v0, 0x1

    goto :goto_6

    :cond_10
    const/4 v0, 0x0

    .line 656
    :goto_6
    iget-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 657
    move/from16 v27, v1

    const-string v1, "previewProgressSource"

    move/from16 v28, v0

    move-object/from16 v0, v18

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 658
    iget-object v1, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v18, v12

    move-object/from16 v12, v17

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    iget-object v1, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v17, v12

    const-string v12, "media"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    iget-object v1, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v12, "clock"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    iput-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    goto :goto_7

    :cond_11
    move-object/from16 v17, v12

    .line 661
    :cond_12
    :goto_7
    const-string v0, "previewObservedAtMs"

    move v1, v13

    const-wide/16 v12, -0x1

    invoke-virtual {v5, v0, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v29

    .line 662
    const-wide/16 v12, 0x0

    cmp-long v0, v29, v12

    if-gez v0, :cond_13

    const-wide/16 v12, -0x1

    goto :goto_8

    :cond_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v12, v12, v29

    .line 663
    :goto_8
    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->foreground:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v29, v5

    const-string v5, " ; source="

    move/from16 v30, v1

    const-string v1, " ms ; \u00e2ge observation="

    move-object/from16 v31, v11

    const-string v11, "mesure="

    const-string v32, "inconnu"

    move/from16 v33, v4

    const-string v4, " ms"

    if-nez v0, :cond_15

    .line 664
    :try_start_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v6, 0x0

    cmp-long v1, v12, v6

    if-gez v1, :cond_14

    :goto_9
    move-object/from16 v1, v32

    goto :goto_a

    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    goto :goto_9

    :goto_a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; \u00e9tat page="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; rejet\u00e9e : arri\u00e8re-plan ; signal audio natif=non lu"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 666
    return-void

    .line 668
    :cond_15
    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    const-wide/high16 v34, 0x7ff8000000000000L    # Double.NaN

    move-object/from16 v36, v1

    if-eqz v0, :cond_16

    move-wide/from16 v0, v34

    goto :goto_b

    :cond_16
    long-to-double v0, v8

    sub-double/2addr v0, v6

    .line 669
    :goto_b
    move-object/from16 v37, v2

    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const-wide/16 v38, 0xbb8

    if-eqz v2, :cond_17

    move-object v2, v4

    move-object/from16 v40, v5

    iget-wide v4, v10, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const-wide/16 v22, 0x0

    cmp-long v4, v4, v22

    if-ltz v4, :cond_18

    iget-wide v4, v10, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v4, v14, v4

    const-wide/16 v41, 0x3e8

    cmp-long v4, v4, v41

    if-ltz v4, :cond_18

    if-eqz v3, :cond_18

    const-wide/16 v4, 0x0

    cmp-long v41, v12, v4

    if-ltz v41, :cond_18

    cmp-long v4, v12, v38

    if-gez v4, :cond_18

    if-eqz v33, :cond_18

    .line 670
    move-object/from16 v4, v24

    move-object/from16 v5, v31

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_19

    const/16 v24, 0x1

    goto :goto_c

    .line 669
    :cond_17
    move-object v2, v4

    move-object/from16 v40, v5

    :cond_18
    move-object/from16 v4, v24

    move-object/from16 v5, v31

    .line 670
    :cond_19
    const/16 v24, 0x0

    .line 674
    :goto_c
    if-eqz v3, :cond_1b

    const-wide/16 v22, 0x0

    cmp-long v31, v12, v22

    if-ltz v31, :cond_1b

    cmp-long v31, v12, v38

    if-gez v31, :cond_1b

    move-object/from16 v31, v4

    iget-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_1c

    iget-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v4, :cond_1c

    if-eqz v33, :cond_1c

    if-nez v30, :cond_1c

    iget-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_1c

    if-eqz v18, :cond_1c

    const-wide/16 v41, 0x2710

    cmp-long v4, v25, v41

    if-ltz v4, :cond_1c

    .line 676
    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_1a

    move-object/from16 v41, v5

    sub-long v4, v25, v38

    long-to-double v4, v4

    cmpl-double v4, v6, v4

    if-ltz v4, :cond_1d

    cmp-long v4, v8, v38

    if-gtz v4, :cond_1d

    const/4 v4, 0x1

    goto :goto_e

    :cond_1a
    move-object/from16 v41, v5

    goto :goto_d

    .line 674
    :cond_1b
    move-object/from16 v31, v4

    :cond_1c
    move-object/from16 v41, v5

    .line 676
    :cond_1d
    :goto_d
    const/4 v4, 0x0

    .line 677
    :goto_e
    iget-object v5, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v42, v11

    move-object/from16 v11, v17

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    const-wide/16 v43, 0x1f40

    goto :goto_f

    :cond_1e
    const-wide/16 v43, 0x1388

    :goto_f
    move-wide/from16 v45, v14

    move-wide/from16 v14, v43

    .line 678
    if-nez v3, :cond_1f

    const-string v3, "invalide"

    :goto_10
    move v5, v4

    goto :goto_11

    :cond_1f
    const-wide/16 v22, 0x0

    cmp-long v3, v12, v22

    if-gez v3, :cond_20

    const-string v3, "\u00e2ge inconnu"

    goto :goto_10

    .line 679
    :cond_20
    cmp-long v3, v12, v38

    if-ltz v3, :cond_21

    const-string v3, "observation ancienne"

    move v5, v4

    goto :goto_11

    .line 680
    :cond_21
    if-nez v33, :cond_22

    const-string v3, "identit\u00e9 incompl\u00e8te"

    move v5, v4

    goto :goto_11

    .line 681
    :cond_22
    iget-boolean v3, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v3, :cond_23

    if-nez v24, :cond_23

    const-string v3, "attente retour 1 s"

    move v5, v4

    goto :goto_11

    .line 682
    :cond_23
    if-nez v4, :cond_24

    if-nez v24, :cond_24

    if-nez v30, :cond_24

    iget-boolean v3, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v3, :cond_24

    iget-boolean v3, v10, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v3, :cond_24

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-nez v3, :cond_24

    move v5, v4

    long-to-double v3, v8

    sub-double/2addr v3, v6

    .line 683
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    long-to-double v14, v14

    cmpl-double v3, v3, v14

    if-ltz v3, :cond_25

    const-string v3, "\u00e9cart >= seuil"

    goto :goto_11

    .line 682
    :cond_24
    move v5, v4

    .line 683
    :cond_25
    move-object/from16 v3, p1

    .line 686
    :goto_11
    const-string v4, "\u00e9cart >= seuil"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 687
    const-wide/16 v14, 0x0

    cmpl-double v4, v0, v14

    if-lez v4, :cond_26

    const/4 v4, 0x1

    goto :goto_12

    :cond_26
    const/4 v4, -0x1

    .line 688
    :goto_12
    iget-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const-wide/16 v22, 0x0

    cmp-long v11, v14, v22

    if-ltz v11, :cond_28

    iget-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    sub-long v14, v45, v14

    const-wide/16 v38, 0x1388

    cmp-long v11, v14, v38

    if-gtz v11, :cond_28

    iget v11, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    if-ne v4, v11, :cond_28

    iget-object v11, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iget-object v14, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_27

    goto :goto_13

    :cond_27
    move-wide/from16 v14, v45

    goto :goto_14

    .line 689
    :cond_28
    :goto_13
    move-wide/from16 v14, v45

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const/4 v11, 0x0

    iput v11, v10, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    iput v4, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    iget-object v4, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iput-object v4, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 691
    :goto_14
    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    iget v4, v10, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v11, 0x1

    add-int/2addr v4, v11

    iput v4, v10, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    .line 692
    iget-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v4, :cond_2a

    iget v4, v10, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v11, 0x3

    if-lt v4, v11, :cond_2a

    move/from16 p1, v5

    iget-wide v4, v10, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    sub-long v4, v14, v4

    const-wide/16 v38, 0x2710

    cmp-long v4, v4, v38

    if-ltz v4, :cond_2b

    .line 693
    iput-wide v6, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v4, v8

    sub-double/2addr v4, v6

    iput-wide v4, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 694
    iget-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v4, :cond_29

    const/4 v4, 0x0

    iput-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 695
    :cond_29
    const/4 v4, 0x1

    iput-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 696
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "resynchronisation douce ; \u00e9cart r\u00e9p\u00e9t\u00e9="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v38, v6

    double-to-long v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v10, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 697
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_15

    .line 692
    :cond_2a
    move/from16 p1, v5

    :cond_2b
    move-wide/from16 v38, v6

    goto :goto_15

    .line 699
    :cond_2c
    move/from16 p1, v5

    move-wide/from16 v38, v6

    move-wide/from16 v14, v45

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    :goto_15
    nop

    .line 700
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    .line 701
    nop

    .line 702
    if-eqz v4, :cond_2e

    if-nez v30, :cond_2d

    iget-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v22, 0x0

    cmp-long v5, v5, v22

    if-ltz v5, :cond_2d

    iget-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v5, v8, v5

    if-eqz v5, :cond_2e

    :cond_2d
    const/4 v5, 0x1

    goto :goto_16

    :cond_2e
    const/4 v5, 0x0

    .line 703
    :goto_16
    iput-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 704
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, v42

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v7, v36

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-wide/16 v22, 0x0

    cmp-long v7, v12, v22

    if-gez v7, :cond_2f

    move-object/from16 v7, v32

    goto :goto_17

    :cond_2f
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_17
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v7, v40

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v10, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ; \u00e9tat page="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v7, v37

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ; \u00e9cart="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 705
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v7

    if-eqz v7, :cond_30

    :goto_18
    move-object/from16 v0, v32

    goto :goto_19

    :cond_30
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    double-to-long v0, v0

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    goto :goto_18

    :goto_19
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 706
    if-eqz v4, :cond_31

    const-string v1, "accept\u00e9e"

    goto :goto_1a

    :cond_31
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "rejet\u00e9e : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 704
    invoke-direct {v10, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 707
    if-eqz v30, :cond_34

    .line 708
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v0, -0x1

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 709
    const/4 v1, 0x0

    iput-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 710
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    const-wide/16 v0, -0x1

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 712
    iget-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v6, v20

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v7, v21

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    goto :goto_1b

    :cond_32
    move-object/from16 v7, v21

    :goto_1b
    const-wide/16 v0, -0x1

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 714
    :cond_33
    move-wide/from16 v0, v34

    goto :goto_1c

    .line 707
    :cond_34
    move-object/from16 v6, v20

    move-object/from16 v7, v21

    move-wide/from16 v0, v38

    .line 714
    :goto_1c
    if-eqz v33, :cond_35

    iput-object v6, v10, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v7, v10, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-wide/from16 v11, v25

    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v2, 0x1

    iput-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    goto :goto_1d

    :cond_35
    move-wide/from16 v11, v25

    .line 715
    :goto_1d
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_37

    if-eqz v30, :cond_36

    goto :goto_1e

    :cond_36
    move-object/from16 v13, v16

    goto :goto_1f

    :cond_37
    :goto_1e
    move-object/from16 v13, v16

    iput-object v13, v10, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 718
    :goto_1f
    const-string v2, "previewConfirmPositionMs"

    move/from16 v16, v5

    move-object/from16 v17, v6

    move-object/from16 v25, v7

    move-wide/from16 v20, v8

    move-object/from16 v5, v29

    const-wide/16 v8, -0x1

    invoke-virtual {v5, v2, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 719
    if-eqz v33, :cond_39

    const-wide/16 v8, 0x0

    cmp-long v2, v6, v8

    if-ltz v2, :cond_39

    cmp-long v2, v6, v11

    if-gtz v2, :cond_39

    .line 720
    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v2, :cond_38

    if-nez v30, :cond_38

    iget v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v2, :cond_38

    iget-object v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v8, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v8, v2, v8

    const-wide/16 v22, 0x0

    cmp-long v2, v8, v22

    if-ltz v2, :cond_38

    iget-object v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v8, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v8, v2, v8

    const-wide/16 v22, 0x0

    cmp-long v2, v8, v22

    if-gez v2, :cond_38

    iget-object v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v8, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v8, v2, v8

    cmp-long v2, v6, v8

    if-eqz v2, :cond_38

    .line 722
    iget-object v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v8, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v14, v2, v8

    .line 723
    :cond_38
    iput-wide v6, v10, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 725
    :cond_39
    if-eqz v4, :cond_3a

    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-eqz v2, :cond_3a

    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v2, :cond_3a

    const/4 v2, 0x0

    iput-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 726
    :cond_3a
    if-eqz v24, :cond_3b

    if-eqz v4, :cond_3b

    .line 727
    const/4 v2, 0x0

    iput-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 728
    const-string v2, "retour confirm\u00e9 par observation coh\u00e9rente ; son non v\u00e9rifi\u00e9"

    invoke-direct {v10, v2}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 730
    :cond_3b
    nop

    .line 731
    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v2, :cond_47

    if-nez v30, :cond_47

    .line 732
    nop

    .line 733
    if-eqz v18, :cond_3c

    iget-wide v8, v10, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v8, v14, v8

    move-wide/from16 v34, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    goto :goto_20

    :cond_3c
    move-wide/from16 v34, v0

    const-wide/16 v8, 0x0

    .line 734
    :goto_20
    iget-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v0, v8

    invoke-static {v11, v12, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 735
    const-wide/16 v8, 0x0

    cmp-long v2, v6, v8

    if-ltz v2, :cond_3d

    cmp-long v8, v6, v11

    if-gtz v8, :cond_3d

    .line 736
    iput-wide v6, v10, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 738
    :cond_3d
    if-ltz v2, :cond_40

    sub-long v0, v6, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v8, 0x9c4

    cmp-long v0, v0, v8

    if-lez v0, :cond_3e

    goto :goto_21

    .line 749
    :cond_3e
    iget v0, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_3f

    iget-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v1, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v14, v0, v1

    iget-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v1, v10, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v2, "position UI proche de la cible"

    aput-object v2, v0, v1

    .line 750
    :cond_3f
    const/4 v1, 0x0

    iput-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v0, v8

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 751
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    .line 752
    const-wide/16 v0, -0x1

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move/from16 v16, v4

    move-wide v2, v6

    move/from16 v8, v18

    move-object/from16 v6, v31

    move-object/from16 v0, v41

    const/4 v1, 0x1

    goto/16 :goto_25

    .line 739
    :cond_40
    :goto_21
    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_41

    if-nez v18, :cond_41

    invoke-direct {v10, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 740
    :cond_41
    if-eqz v18, :cond_42

    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_42

    const/4 v0, 0x1

    goto :goto_22

    :cond_42
    const/4 v0, 0x0

    :goto_22
    iput-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v0, 0x1

    iput-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 741
    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_44

    if-nez v4, :cond_43

    move-object/from16 v6, v31

    move-object/from16 v0, v41

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_45

    goto :goto_23

    :cond_43
    move-object/from16 v6, v31

    move-object/from16 v0, v41

    :goto_23
    iput-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_24

    :cond_44
    move-object/from16 v6, v31

    move-object/from16 v0, v41

    .line 742
    :cond_45
    :goto_24
    iget-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_46

    if-eqz v4, :cond_46

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    .line 743
    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    move/from16 v8, v18

    iput-boolean v8, v10, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_46

    iput-boolean v8, v10, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 745
    :cond_46
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void

    .line 731
    :cond_47
    move-wide/from16 v34, v0

    move/from16 v8, v18

    move-object/from16 v6, v31

    move-object/from16 v0, v41

    .line 754
    move-wide/from16 v2, v20

    const/4 v1, 0x0

    :goto_25
    if-eqz v4, :cond_5a

    .line 755
    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 756
    iget-boolean v7, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v7, :cond_54

    if-nez v30, :cond_54

    if-nez p1, :cond_54

    invoke-static/range {v34 .. v35}, Ljava/lang/Double;->isNaN(D)Z

    move-result v7

    if-eqz v7, :cond_48

    move-object/from16 v31, v0

    move-object/from16 v29, v5

    move-object/from16 v24, v6

    move/from16 v18, v8

    move-wide v0, v11

    goto/16 :goto_2b

    .line 759
    :cond_48
    if-eqz v24, :cond_4e

    iget-boolean v7, v10, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v7, :cond_4e

    .line 762
    if-eqz v8, :cond_4a

    move-object/from16 v31, v0

    long-to-double v0, v2

    sub-double v0, v0, v34

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v18, 0x40a7700000000000L    # 3000.0

    cmpl-double v0, v0, v18

    if-ltz v0, :cond_49

    goto :goto_26

    :cond_49
    const/4 v0, 0x0

    goto :goto_27

    :cond_4a
    move-object/from16 v31, v0

    :goto_26
    const/4 v0, 0x1

    .line 763
    :goto_27
    if-eqz v0, :cond_4b

    move-object/from16 v29, v5

    move-object/from16 v24, v6

    long-to-double v5, v2

    goto :goto_28

    :cond_4b
    move-object/from16 v29, v5

    move-object/from16 v24, v6

    move-wide/from16 v5, v34

    :goto_28
    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    if-eqz v0, :cond_4c

    const-wide/16 v5, 0x0

    goto :goto_29

    :cond_4c
    long-to-double v5, v2

    sub-double v5, v5, v34

    :goto_29
    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 764
    if-eqz v0, :cond_4d

    const-string v0, "retour : saut"

    goto :goto_2a

    :cond_4d
    const-string v0, "retour : correction <=1,25x"

    :goto_2a
    invoke-direct {v10, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 765
    move/from16 v18, v8

    move-wide v0, v11

    goto/16 :goto_2c

    .line 759
    :cond_4e
    move-object/from16 v31, v0

    move-object/from16 v29, v5

    move-object/from16 v24, v6

    .line 765
    if-eqz v1, :cond_4f

    if-nez v8, :cond_4f

    .line 766
    long-to-double v0, v11

    move-wide/from16 v5, v34

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    move-wide/from16 v18, v11

    const-wide/16 v11, 0x0

    invoke-static {v11, v12, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v0, v2

    sub-double/2addr v0, v5

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    move-wide/from16 v0, v18

    move/from16 v18, v8

    goto/16 :goto_2c

    .line 765
    :cond_4f
    move-wide/from16 v18, v11

    move-wide/from16 v5, v34

    .line 767
    if-eqz v16, :cond_50

    if-nez v8, :cond_50

    if-nez v28, :cond_50

    .line 768
    move-wide/from16 v0, v18

    long-to-double v11, v0

    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    const-wide/16 v11, 0x0

    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v5

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    move/from16 v18, v8

    goto :goto_2c

    .line 767
    :cond_50
    move-wide/from16 v0, v18

    .line 769
    if-eqz v16, :cond_51

    if-nez v28, :cond_51

    .line 770
    long-to-double v11, v0

    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v11

    move/from16 v18, v8

    const-wide/16 v7, 0x0

    invoke-static {v7, v8, v11, v12}, Ljava/lang/Math;->max(DD)D

    move-result-wide v11

    iput-wide v11, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v7, v2

    sub-double/2addr v7, v5

    iput-wide v7, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2c

    .line 769
    :cond_51
    move/from16 v18, v8

    .line 771
    if-eqz v27, :cond_52

    if-eqz v18, :cond_53

    if-nez v28, :cond_53

    :cond_52
    if-nez v27, :cond_55

    if-eqz v18, :cond_55

    .line 772
    :cond_53
    long-to-double v7, v0

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    const-wide/16 v7, 0x0

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v5

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v7, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2c

    .line 756
    :cond_54
    move-object/from16 v31, v0

    move-object/from16 v29, v5

    move-object/from16 v24, v6

    move/from16 v18, v8

    move-wide v0, v11

    .line 757
    :goto_2b
    long-to-double v5, v2

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 758
    if-eqz p1, :cond_55

    const-string v5, "retour d\u00e9but observ\u00e9 ; lecture non command\u00e9e"

    invoke-direct {v10, v5}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 774
    :cond_55
    :goto_2c
    if-eqz v16, :cond_57

    .line 775
    iget-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-ltz v5, :cond_56

    iget-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v5, v5, v7

    if-ltz v5, :cond_56

    if-eqz v18, :cond_56

    .line 776
    iget-object v5, v10, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    iget v6, v10, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget-wide v7, v10, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v7, v14, v7

    aput-wide v7, v5, v6

    .line 777
    iget v5, v10, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    const/4 v6, 0x1

    add-int/2addr v5, v6

    iget-object v6, v10, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v6, v6

    rem-int/2addr v5, v6

    iput v5, v10, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 778
    iget v5, v10, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    iget-object v6, v10, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v6, v6

    if-ge v5, v6, :cond_56

    iget v5, v10, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    const/4 v6, 0x1

    add-int/2addr v5, v6

    iput v5, v10, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 780
    :cond_56
    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v2, v10, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 782
    :cond_57
    const/4 v5, 0x1

    iput-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 783
    iget-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v5, :cond_58

    iget-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v5, :cond_58

    iget-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 784
    :cond_58
    if-eqz v33, :cond_59

    if-eqz v18, :cond_59

    if-nez v28, :cond_59

    iget-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v5, :cond_59

    const/4 v5, 0x1

    goto :goto_2d

    :cond_59
    const/4 v5, 0x0

    :goto_2d
    iput-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_2f

    .line 785
    :cond_5a
    move-object/from16 v31, v0

    move-object/from16 v29, v5

    move-object/from16 v24, v6

    move/from16 v18, v8

    move-wide v0, v11

    move-wide/from16 v5, v34

    iget-boolean v7, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v7, :cond_5e

    if-nez v30, :cond_5e

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    move-result v7

    if-nez v7, :cond_5e

    .line 786
    if-eqz v18, :cond_5b

    if-eqz v28, :cond_5c

    :cond_5b
    iget-boolean v7, v10, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v7, :cond_5c

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 787
    :cond_5c
    if-eqz v18, :cond_5d

    if-nez v28, :cond_5d

    iget-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v5, :cond_5d

    const/4 v5, 0x1

    goto :goto_2e

    :cond_5d
    const/4 v5, 0x0

    :goto_2e
    iput-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_2f

    .line 788
    :cond_5e
    const/4 v5, 0x0

    iput-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 789
    :goto_2f
    iget-boolean v5, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v5, :cond_60

    if-nez v4, :cond_5f

    move-object/from16 v5, v24

    move-object/from16 v11, v31

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_61

    goto :goto_30

    :cond_5f
    move-object/from16 v5, v24

    move-object/from16 v11, v31

    :goto_30
    iput-object v11, v10, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_31

    :cond_60
    move-object/from16 v5, v24

    move-object/from16 v11, v31

    .line 790
    :cond_61
    :goto_31
    const/4 v6, 0x1

    iput-boolean v6, v10, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 791
    iget-boolean v6, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v6, :cond_63

    if-eqz v4, :cond_63

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_63

    .line 792
    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    .line 793
    move/from16 v8, v18

    iput-boolean v8, v10, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 794
    iget-boolean v6, v10, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v6, :cond_62

    iget-boolean v6, v10, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-ne v8, v6, :cond_62

    const/4 v6, 0x0

    iput-boolean v6, v10, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v6, v10, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v18, 0x1

    add-long v6, v6, v18

    iput-wide v6, v10, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 795
    :cond_62
    iget-boolean v6, v10, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v6, :cond_64

    iput-boolean v8, v10, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    goto :goto_32

    .line 791
    :cond_63
    move/from16 v8, v18

    .line 797
    :cond_64
    :goto_32
    if-eqz v4, :cond_65

    if-eqz v33, :cond_65

    iget-boolean v4, v10, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_65

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_65

    .line 798
    move-wide/from16 v18, v0

    move-object/from16 v1, p0

    move-wide v6, v2

    move-object/from16 v2, v29

    move-object/from16 v3, v17

    move-object v0, v5

    move-object/from16 v4, v25

    move-object v5, v11

    move-object v12, v13

    move v13, v8

    move-wide/from16 v8, v18

    invoke-direct/range {v1 .. v9}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    goto :goto_33

    .line 797
    :cond_65
    move-object v0, v5

    move-object v12, v13

    move v13, v8

    .line 799
    :goto_33
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 800
    const-string v1, "apr\u00e8s mesure"

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 801
    iget-wide v1, v10, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_68

    iget-wide v1, v10, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_68

    iget-wide v1, v10, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_68

    iget v1, v10, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_66

    .line 802
    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    iget-boolean v0, v10, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eq v13, v0, :cond_67

    :cond_66
    iget v0, v10, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_68

    .line 803
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_68

    iget-object v0, v10, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_68

    .line 804
    :cond_67
    iput-wide v14, v10, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->uiAt:J
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 810
    :cond_68
    goto :goto_35

    .line 806
    :catch_0
    move-exception v0

    .line 807
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {v10, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    .line 808
    iget-boolean v2, v10, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_69

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_69

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->base:D

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v10, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v10, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 v1, 0x0

    iput-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_34

    :cond_69
    const/4 v1, 0x0

    .line 809
    :goto_34
    iput-boolean v1, v10, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v0, "mesure rejet\u00e9e : format invalide"

    invoke-direct {v10, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 811
    :goto_35
    return-void
.end method

.method public tapPlayPause()I
    .locals 7

    .line 821
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 822
    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gez v0, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    cmp-long v0, v2, v4

    if-ltz v0, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x1388

    cmp-long v0, v2, v4

    if-gez v0, :cond_2

    :cond_1
    return v1

    .line 823
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 824
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 825
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v3, :cond_3

    invoke-direct {p0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 827
    :cond_3
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    :cond_4
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-nez v1, :cond_6

    :cond_5
    :goto_0
    move v4, v0

    :cond_6
    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    .line 828
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 829
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 830
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 831
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v0, 0x1f40

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 838
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    return v0

    .line 821
    :cond_7
    :goto_1
    return v1
.end method
