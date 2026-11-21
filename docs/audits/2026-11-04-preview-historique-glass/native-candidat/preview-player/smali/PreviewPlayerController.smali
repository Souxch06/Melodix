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

.field private static final COVER_STORE:Ljava/lang/String; = "preview_cover"

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

.field private static bgAt:J

.field private static bgJson:Ljava/lang/String;

.field private static bgPlaying:Z

.field private static bgPos:J

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

.field private bridgeState:Ljava/lang/String;

.field private cacheLoading:Z

.field private cacheOutcome:Ljava/lang/String;

.field private cacheReadMs:J

.field private cacheStart:J

.field private cachedDuration:J

.field private cachedElapsed:J

.field private cachedRemaining:J

.field private commandAt:J

.field private correction:D

.field private coverAsked:Ljava/lang/String;

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

.field private fullArtist:Ljava/lang/String;

.field private final glow:[Landroid/animation/ObjectAnimator;

.field private final glowFill:[Landroid/graphics/drawable/Drawable;

.field private glowSampleValid:Z

.field private final handler:Landroid/os/Handler;

.field private haveReal:Z

.field private homeAt:J

.field private homeRows:Ljava/lang/String;

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

.field private pendingLiveAt:J

.field private pendingLiveKey:Ljava/lang/String;

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

    .line 159
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->bgPos:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    .line 167
    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    .line 168
    const-string v2, ""

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    const-string v2, "unknown"

    sput-object v2, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    .line 187
    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 1015
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

    .line 522
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

    .line 149
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 150
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 151
    const/16 v6, 0x78

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 153
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 154
    const/16 v6, 0x14

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    .line 156
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    .line 161
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    .line 163
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 178
    const/4 v5, 0x2

    new-array v6, v5, [Landroid/animation/ObjectAnimator;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 179
    new-array v5, v5, [Landroid/graphics/drawable/Drawable;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 181
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 182
    const/16 v5, 0x3c

    new-array v5, v5, [J

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 185
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 189
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 200
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 201
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 202
    const-string v3, "non observ\u00e9e"

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 215
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 216
    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    .line 236
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 237
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    .line 238
    const-string v2, "non charg\u00e9"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    .line 239
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->pendingLiveKey:Ljava/lang/String;

    .line 363
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 473
    const-string v2, "non relev\u00e9 (rouvrir le diagnostic)"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    .line 474
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    .line 575
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 715
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$6;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerController$6;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    .line 1014
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    .line 1020
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$8;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$8;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    .line 523
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 524
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz p1, :cond_0

    .line 525
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 526
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 527
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 528
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 529
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 530
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 531
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 533
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

.method static synthetic access$4000(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$4002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    return p1
.end method

.method static synthetic access$4100(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->oembed(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4200(Lcom/melodix/music/PreviewPlayerController;)Landroid/os/Handler;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$4300(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return p0
.end method

.method static synthetic access$4302(Lcom/melodix/music/PreviewPlayerController;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return p1
.end method

.method static synthetic access$4400(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$4502(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    return-wide p1
.end method

.method static synthetic access$4600(Lcom/melodix/music/PreviewPlayerController;F)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    return-void
.end method

.method static synthetic access$4702(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    return-object p1
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

    .line 433
    :try_start_0
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 434
    :cond_0
    const-string v0, "melodix_playlists"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 435
    if-nez p0, :cond_1

    return-object p2

    .line 436
    :cond_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_2

    return-object p2

    .line 437
    :cond_2
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 438
    const-string v0, "title"

    const-string v1, "Copie enregistr\u00e9e"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "subtitle"

    const-string v1, "Actualisation des titres en cours\u2026"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "settingValue"

    const-string v1, "Info"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 439
    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 433
    :cond_3
    :goto_0
    return-object p2

    .line 440
    :catch_0
    move-exception p0

    return-object p2
.end method

.method private callStyler(Ljava/lang/String;)V
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
    :try_start_0
    const-string v1, "com.melodix.music.GlassScreenStyler"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/app/Activity;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 233
    :catchall_0
    move-exception p1

    :goto_0
    nop

    .line 234
    return-void
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

    .line 557
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

    .line 558
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

    .line 741
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

    .line 742
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

.method public static cover(Landroid/widget/ImageView;Ljava/lang/String;I)V
    .locals 1

    .line 285
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 286
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v0, "/liked-songs/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 287
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/Picasso$R;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/picasso/Picasso$R;->noPlaceholder()Lcom/squareup/picasso/Picasso$R;

    move-result-object v0

    invoke-virtual {v0, p2, p2}, Lcom/squareup/picasso/Picasso$R;->resize(II)Lcom/squareup/picasso/Picasso$R;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/picasso/Picasso$R;->centerCrop()Lcom/squareup/picasso/Picasso$R;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/picasso/Picasso$R;->into(Landroid/widget/ImageView;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {p0, p1, p2}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 289
    :goto_0
    return-void

    .line 286
    :cond_2
    :goto_1
    invoke-static {p0, p1, p2}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    return-void

    .line 285
    :cond_3
    :goto_2
    return-void
.end method

.method static coverFromOembed(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 402
    const-string v0, "\"thumbnail_url\"\\s*:\\s*\"(https://[^\"\\\\]+)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 403
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 404
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "/"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 405
    const-string v2, ".scdn.co"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, ".spotifycdn.com"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    move-object v1, p0

    :cond_2
    return-object v1
.end method

.method private delta(J)Ljava/lang/String;
    .locals 4

    .line 1027
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

    .line 1017
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 1018
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

    .line 1019
    :cond_2
    return-void
.end method

.method private dominantPhase()Ljava/lang/String;
    .locals 18

    .line 1045
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

    .line 1047
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

    .line 1048
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

    const/4 v1, 0x2

    aput-wide v10, v6, v1

    const/4 v1, 0x3

    aput-wide v12, v6, v1

    const/4 v1, 0x4

    aput-wide v14, v6, v1

    .line 1049
    const-string v1, "r\u00e9ception \u2192 rendu natif"

    const-string v2, "rendu \u2192 frame"

    const-string v8, "attente pont"

    const-string v9, "navigation \u2192 page pr\u00eate"

    const-string v10, "page/pont \u2192 lignes re\u00e7ues"

    filled-new-array {v8, v9, v10, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 1050
    nop

    .line 1051
    const-string v2, "ind\u00e9termin\u00e9e"

    const-wide/16 v16, -0x1

    :goto_2
    if-ge v7, v5, :cond_4

    aget-wide v8, v6, v7

    cmp-long v8, v8, v3

    if-ltz v8, :cond_3

    aget-wide v8, v6, v7

    cmp-long v8, v8, v16

    if-lez v8, :cond_3

    aget-wide v8, v6, v7

    aget-object v2, v1, v7

    move-wide/from16 v16, v8

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1052
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (phases observ\u00e9es uniquement)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1046
    :cond_5
    :goto_3
    const-string v1, "ind\u00e9termin\u00e9e (phases manquantes ou non s\u00e9quentielles)"

    return-object v1
.end method

.method private freezeForBackground(Ljava/lang/String;)V
    .locals 7

    .line 623
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 624
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 625
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v3

    .line 626
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-nez v5, :cond_0

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 627
    :cond_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    .line 628
    const-string v1, "interrupted"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v0, v5

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 629
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 630
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

    .line 631
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

    .line 630
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 632
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 633
    return-void
.end method

.method private static keepText(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 565
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 566
    instance-of p1, p0, Landroid/widget/TextView;

    if-eqz p1, :cond_0

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 567
    :cond_0
    return-void
.end method

.method private now()J
    .locals 2

    .line 541
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private oembed(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 381
    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 388
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 389
    :goto_0
    return-void
.end method

.method static oembedCover(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 391
    nop

    .line 393
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://open.spotify.com/oembed?url=https%3A%2F%2Fopen.spotify.com%2F"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    const-string v4, "%2F"

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 394
    const/16 v1, 0x1388

    :try_start_1
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 395
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_1

    .line 399
    if-eqz p0, :cond_0

    :try_start_2
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 395
    :cond_0
    :goto_0
    return-object v0

    .line 396
    :cond_1
    :try_start_3
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    const/high16 v2, 0x10000

    new-array v3, v2, [B

    const/4 v4, 0x0

    move v5, v4

    .line 397
    :goto_1
    if-ge v5, v2, :cond_2

    sub-int v6, v2, v5

    invoke-virtual {v1, v3, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    if-lez v6, :cond_2

    add-int/2addr v5, v6

    goto :goto_1

    .line 398
    :cond_2
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, v3, v4, v5, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->coverFromOembed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 399
    if-eqz p0, :cond_3

    :try_start_4
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p0

    .line 398
    :cond_3
    :goto_2
    return-object v0

    .line 399
    :catchall_2
    move-exception v1

    goto :goto_3

    :catchall_3
    move-exception p0

    move-object p0, v0

    :goto_3
    if-eqz p0, :cond_4

    :try_start_5
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    goto :goto_4

    :catchall_4
    move-exception p0

    :cond_4
    :goto_4
    return-object v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 2

    .line 1041
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

    .line 427
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

    .line 428
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

    .line 429
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

    .line 543
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

    .line 546
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_0

    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1

    .line 547
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_1

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    return-wide p1

    .line 548
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 549
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_2

    move-wide v0, p1

    .line 552
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

    .line 553
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    long-to-double p1, p1

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    mul-double/2addr v6, p1

    .line 554
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

    .line 1029
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const-string v0, "lecture interrompue au d\u00e9part ; audio non v\u00e9rifi\u00e9"

    return-object v0

    .line 1030
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const-string v0, "\u00e9tat du lecteur indisponible"

    return-object v0

    .line 1031
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_2

    const-string v0, "pause demand\u00e9e"

    return-object v0

    .line 1032
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    return-object v0

    .line 1033
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "lecture en pause"

    return-object v0

    .line 1034
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_5

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    return-object v0

    .line 1035
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_6

    const-string v0, "position ou dur\u00e9e indisponible"

    return-object v0

    .line 1036
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_7

    const-string v0, "mouvement arr\u00eat\u00e9"

    return-object v0

    .line 1037
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

    .line 1038
    :cond_8
    const-string v0, "animation active"

    return-object v0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .line 764
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

    .line 765
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 766
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

    .line 764
    :goto_0
    return p0
.end method

.method private recordReturn(Ljava/lang/String;)V
    .locals 7

    .line 170
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    .line 171
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

    .line 172
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

    .line 173
    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    add-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v0, v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    .line 174
    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_1

    iget p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    .line 175
    :cond_1
    return-void
.end method

.method private renderButtons()V
    .locals 5

    .line 728
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_a

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 731
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

    .line 732
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

    .line 733
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

    .line 734
    :cond_4
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    .line 735
    :cond_5
    if-ne v3, v4, :cond_6

    const-string v1, "Mettre en pause"

    goto :goto_2

    :cond_6
    const-string v1, "Lire"

    goto :goto_2

    .line 734
    :cond_7
    :goto_1
    const-string v1, "\u00c9tat de lecture inconnu"

    .line 736
    :goto_2
    const v2, 0x7f090238

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v4, 0x7f09023e

    invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 737
    instance-of v4, v2, Landroid/widget/ImageView;

    if-eqz v4, :cond_8

    move-object v4, v2

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 738
    :cond_8
    instance-of v2, v0, Landroid/widget/ImageView;

    if-eqz v2, :cond_9

    move-object v2, v0

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 739
    :cond_9
    return-void

    .line 728
    :cond_a
    :goto_3
    return-void
.end method

.method private renderProgress()V
    .locals 17

    .line 583
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return-void

    .line 586
    :cond_0
    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_1

    const v2, 0x7f090236

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->keepText(Landroid/app/Activity;ILjava/lang/String;)V

    const v2, 0x7f09023b

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->keepText(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const v3, 0x7f090237

    invoke-static {v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->keepText(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const v4, 0x7f09023c

    invoke-static {v1, v4, v2}, Lcom/melodix/music/PreviewPlayerController;->keepText(Landroid/app/Activity;ILjava/lang/String;)V

    .line 587
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-le v2, v5, :cond_1

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-static {v2, v5}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-static {v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->setIfDifferent(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-static {v1, v4, v2}, Lcom/melodix/music/PreviewPlayerController;->setIfDifferent(Landroid/app/Activity;ILjava/lang/String;)V

    .line 588
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 589
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    const-wide/16 v5, 0x0

    if-eqz v4, :cond_2

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    cmp-long v4, v7, v5

    if-ltz v4, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v7

    iget-wide v9, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    sub-long/2addr v7, v9

    const-wide/16 v9, 0x1770

    cmp-long v4, v7, v9

    if-gez v4, :cond_2

    return-void

    .line 590
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    const-string v8, "nativePlayerRemaining"

    const v9, 0x7f09023a

    const v10, 0x7f09023d

    const v11, 0x7f09024d

    const v12, 0x7f09024b

    const v13, 0x7f09024a

    if-eqz v4, :cond_5

    .line 591
    const-string v2, "-:--"

    invoke-direct {v0, v1, v13, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    invoke-direct {v0, v1, v12, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 592
    const/4 v2, 0x0

    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    invoke-direct {v0, v1, v10, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 593
    invoke-virtual {v1, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 594
    if-nez v1, :cond_3

    const/4 v7, 0x0

    goto :goto_0

    :cond_3
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 595
    :goto_0
    instance-of v1, v7, Landroid/widget/TextView;

    if-eqz v1, :cond_4

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "Temps restant : \u2014"

    invoke-virtual {v2, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 596
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 597
    :cond_4
    return-void

    .line 599
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 600
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    double-to-long v14, v14

    move-object/from16 v16, v8

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v7, v14

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 601
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v9, 0x3e8

    div-long v4, v14, v9

    cmp-long v12, v12, v4

    if-eqz v12, :cond_6

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v14, v15}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 602
    :cond_6
    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    div-long/2addr v12, v9

    cmp-long v4, v4, v12

    if-eqz v4, :cond_7

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    div-long/2addr v4, v9

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    .line 603
    :cond_7
    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    div-long v12, v7, v9

    cmp-long v4, v4, v12

    if-eqz v4, :cond_8

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

    .line 604
    :cond_8
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

    .line 605
    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v3, 0x7f09023d

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 606
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const v3, 0x7f09024a

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const v3, 0x7f09024b

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 607
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 608
    if-nez v1, :cond_9

    const/4 v7, 0x0

    goto :goto_1

    :cond_9
    move-object/from16 v2, v16

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 609
    :goto_1
    instance-of v1, v7, Landroid/widget/TextView;

    if-eqz v1, :cond_a

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 610
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 611
    :cond_a
    return-void
.end method

.method private report()Ljava/lang/String;
    .locals 17

    .line 1055
    move-object/from16 v1, p0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1056
    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-gez v0, :cond_0

    const-string v0, "Appui : \u2014\nCommande re\u00e7ue du pont : "

    goto :goto_0

    :cond_0
    const-string v0, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    invoke-direct {v1, v3, v4}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1057
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {v1, v3, v4}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1058
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {v1, v3, v4}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1059
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {v1, v3, v4}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1060
    const-string v0, "\nCache local : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " ; \u00e9criture : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->writeStatus()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1061
    const-string v0, "\nCache local : lecture et application \u00e9ventuelle des vues, sans mesure de frame : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v1, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    cmp-long v3, v3, v5

    const-string v4, " ms"

    const-string v7, "\u2014"

    if-gez v3, :cond_1

    move-object v3, v7

    goto :goto_1

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    invoke-virtual {v3, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1062
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1063
    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v3, v8, v5

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

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1064
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1065
    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v3, v8, v5

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

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1066
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1067
    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v3, v8, v5

    if-gez v3, :cond_4

    move-object v3, v7

    goto :goto_4

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1068
    const-string v0, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1069
    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    cmp-long v3, v8, v5

    if-gez v3, :cond_5

    move-object v3, v7

    goto :goto_5

    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1070
    const-string v3, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1071
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1074
    const/4 v3, 0x1

    :try_start_0
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    if-nez v0, :cond_6

    const/4 v8, 0x0

    goto :goto_6

    :cond_6
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v8

    .line 1075
    :goto_6
    const-string v9, "^https://open\\.spotify\\.com/([a-z-]*)"

    invoke-static {v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v9

    if-nez v8, :cond_7

    const-string v10, ""

    goto :goto_7

    :cond_7
    move-object v10, v8

    :goto_7
    invoke-virtual {v9, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    .line 1076
    const-string v10, "\nPage Spotify (type de route seulement) : "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-nez v0, :cond_8

    const-string v0, "WebView absente"

    goto :goto_9

    :cond_8
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "chargement "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v0}, Landroid/webkit/WebView;->getProgress()I

    move-result v0

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v11, " % ; route="

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v9}, Ljava/util/regex/Matcher;->find()Z

    move-result v11

    if-eqz v11, :cond_a

    invoke-virtual {v9, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_9

    const-string v8, "accueil"

    goto :goto_8

    :cond_9
    invoke-virtual {v9, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_8

    :cond_a
    if-nez v8, :cond_b

    const-string v8, "aucune"

    goto :goto_8

    :cond_b
    const-string v8, "hors Spotify"

    :goto_8
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_9
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1077
    goto :goto_a

    :catch_0
    move-exception v0

    const-string v0, "\nPage Spotify : non lisible"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1080
    :goto_a
    const-string v0, "\nPont (d\u00e9marr\u00e9 ; termin\u00e9 ; mode ; erreur ; CSP ; octets, relev\u00e9 pr\u00e9c\u00e9dent) : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1082
    :try_start_1
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1083
    if-eqz v0, :cond_c

    const-string v8, "(function(){try{var w=window;return [w.__sfMelodixBridgeStarted===true,w.__sfMelodixBridgeCompleted===true,String(w.__sfBridgeExecMode||\'-\'),String(w.__sfBridgeLastError||\'-\'),w.__sfBridgeCspViolation?1:0,w.__sfBridgeBytes|0].join(\' ; \')}catch(e){return \'erreur\'}})()"

    new-instance v9, Lcom/melodix/music/PreviewPlayerController$10;

    invoke-direct {v9, v1}, Lcom/melodix/music/PreviewPlayerController$10;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v8, v9}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1085
    :cond_c
    goto :goto_b

    :catch_1
    move-exception v0

    const-string v0, "non lisible"

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    .line 1086
    :goto_b
    const-string v0, "\nSource position : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1087
    const-string v0, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    const-string v9, "oui"

    const-string v10, "non"

    if-eqz v8, :cond_d

    move-object v8, v9

    goto :goto_c

    :cond_d
    move-object v8, v10

    :goto_c
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1088
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1089
    const-string v0, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v8, :cond_e

    goto :goto_d

    :cond_e
    move-object v9, v10

    :goto_d
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1090
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1091
    const-string v0, " ; \u00e2ge de la mesure : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v8, v8, v5

    if-gez v8, :cond_f

    move-object v8, v7

    goto :goto_e

    :cond_f
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v11

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long/2addr v11, v13

    invoke-static {v5, v6, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_e
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1092
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {v1, v8, v9, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1093
    const-string v0, " ; appui \u2192 navigation : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    invoke-direct {v1, v8, v9, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1094
    const-string v0, " ; titres affich\u00e9s : premi\u00e8re liste="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v8, v1, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez v8, :cond_10

    move-object v8, v7

    goto :goto_f

    :cond_10
    iget v8, v1, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    :goto_f
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ", derni\u00e8re="

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v8, v1, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    if-gez v8, :cond_11

    move-object v8, v7

    goto :goto_10

    :cond_11
    iget v8, v1, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    :goto_10
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1095
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {v1, v8, v9, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1096
    const-string v0, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v8, v8, v5

    if-ltz v8, :cond_12

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    goto :goto_11

    :cond_12
    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    :goto_11
    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {v1, v8, v9, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1097
    const-string v0, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {v1, v8, v9, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1098
    const-string v0, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {v1, v8, v9, v11, v12}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1099
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v0, :cond_14

    const-string v0, "\nLik\u00e9s : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, v1, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1100
    const-string v8, " ; rendu natif : "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v8, v8, v5

    if-gez v8, :cond_13

    const-string v8, "non observ\u00e9"

    goto :goto_12

    :cond_13
    const-string v8, "lignes visibles"

    :goto_12
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1101
    :cond_14
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1102
    const-string v0, " ; waiting-bridge avec lignes : "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v8, v8, v5

    if-gez v8, :cond_15

    const-string v10, "ind\u00e9termin\u00e9"

    goto :goto_13

    :cond_15
    iget-object v8, v1, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v9, "waiting-bridge"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_16

    iget-boolean v8, v1, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v8, :cond_17

    :cond_16
    const-string v10, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    :cond_17
    :goto_13
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1103
    const-string v0, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1104
    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v0, :cond_18

    const-string v0, " aucun"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1105
    :cond_18
    const/4 v0, 0x0

    move v8, v0

    :goto_14
    iget v9, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-ge v8, v9, :cond_1a

    .line 1106
    iget v9, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget v10, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    sub-int/2addr v9, v10

    add-int/2addr v9, v3

    add-int/2addr v9, v8

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v10, v10

    add-int/2addr v9, v10

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v10, v10

    rem-int/2addr v9, v10

    .line 1107
    const-string v10, "\n#"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    aget-wide v12, v11, v9

    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " rel\u00e2chement : 0 ms ; envoi WebView : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v12, v11, v9

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    aget-wide v14, v11, v9

    .line 1108
    invoke-direct {v1, v12, v13, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1109
    const-string v10, " ; fin JS : "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v12, v11, v9

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    aget-wide v14, v11, v9

    invoke-direct {v1, v12, v13, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 1110
    const-string v11, " ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v12, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v12, v12, v9

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, ")"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1111
    const-string v10, " ; premi\u00e8re position UI diff\u00e9rente : "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v13, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v14, v13, v9

    iget-object v13, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v16, v4

    aget-wide v3, v13, v9

    invoke-direct {v1, v14, v15, v3, v4}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1112
    const-string v3, " ; position UI confirm\u00e9e : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v13, v4, v9

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    aget-wide v5, v4, v9

    invoke-direct {v1, v13, v14, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1113
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v4, v4, v9

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1114
    const-string v3, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1115
    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v5, v4, v9

    const-wide/16 v10, 0x0

    cmp-long v4, v5, v10

    if-gez v4, :cond_19

    move-object v4, v7

    move-object/from16 v5, v16

    goto :goto_15

    :cond_19
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v9, v5, v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v5, v16

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_15
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1105
    add-int/lit8 v8, v8, 0x1

    move-object v4, v5

    const/4 v3, 0x1

    const-wide/16 v5, 0x0

    goto/16 :goto_14

    .line 1117
    :cond_1a
    move-object v5, v4

    const-string v3, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1118
    const-string v3, "\nIntervalles position : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1119
    iget v3, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v3, :cond_1b

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1120
    :cond_1b
    move v3, v0

    :goto_16
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-ge v3, v4, :cond_1d

    .line 1121
    if-lez v3, :cond_1c

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1122
    :cond_1c
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget v6, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    sub-int/2addr v4, v6

    add-int/2addr v4, v3

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v6, v6

    add-int/2addr v4, v6

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v6, v6

    rem-int/2addr v4, v6

    .line 1123
    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v7, v6, v4

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1120
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 1125
    :cond_1d
    const-string v3, "\nRetour \u2014 absence : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-gez v4, :cond_1e

    const-string v4, "inconnue"

    goto :goto_17

    :cond_1e
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_17
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1126
    const-string v3, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1127
    const-string v3, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1128
    move v3, v0

    :goto_18
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    const-string v5, "\n"

    if-ge v3, v4, :cond_1f

    .line 1129
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    iget v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    sub-int/2addr v4, v6

    add-int/2addr v4, v3

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v6, v6

    add-int/2addr v4, v6

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v6, v6

    rem-int/2addr v4, v6

    .line 1130
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v4, v6, v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1128
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 1132
    :cond_1f
    const-string v3, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1133
    move v3, v0

    :goto_19
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    if-ge v3, v4, :cond_20

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    aget-object v6, v6, v3

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 1134
    :cond_20
    const-string v3, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1135
    nop

    :goto_1a
    iget v3, v1, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-ge v0, v3, :cond_21

    .line 1136
    iget v3, v1, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    sub-int/2addr v3, v4

    add-int/2addr v3, v0

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v4, v4

    add-int/2addr v3, v4

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v4, v4

    rem-int/2addr v3, v4

    .line 1137
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v3, v6, v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1135
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .line 1139
    :cond_21
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1140
    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1141
    invoke-static {}, Lcom/melodix/music/PreviewPlayerVolume;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1142
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1143
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private resetDivergence()V
    .locals 2

    .line 634
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

.method private restoreCoverNow(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 4

    .line 355
    const-string v0, "preview_cover"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 356
    const-string v1, "u"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v3, "k"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 357
    :cond_0
    const p2, 0x7f090244

    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f090245

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 358
    instance-of v0, p2, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    check-cast p2, Landroid/widget/ImageView;

    const/16 v0, 0xc0

    invoke-static {p2, v1, v0}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 359
    :cond_1
    instance-of p2, p1, Landroid/widget/ImageView;

    if-eqz p2, :cond_2

    check-cast p1, Landroid/widget/ImageView;

    const/16 p2, 0x2d0

    invoke-static {p1, v1, p2}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 360
    :cond_2
    return-void

    .line 356
    :cond_3
    :goto_0
    return-void
.end method

.method static sameArtists(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 577
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 578
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 579
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

    .line 580
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

    .line 579
    :goto_0
    return v1
.end method

.method private saveInProcess()V
    .locals 2

    .line 535
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 536
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    .line 537
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 538
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 539
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

    .line 540
    return-void
.end method

.method private saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 10

    .line 319
    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-wide v5, p5

    move-wide/from16 v7, p7

    invoke-direct/range {v0 .. v9}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJZ)V

    return-void
.end method

.method private saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJZ)V
    .locals 16

    .line 323
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p7

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Landroid/app/Activity;

    const-string v9, "cover"

    const-string v10, "\n"

    const-string v11, ""

    if-eqz v8, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v8, v0, v12}, Lcom/melodix/music/PreviewPlayerController;->rememberCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 325
    :cond_0
    :goto_0
    if-eqz v8, :cond_1

    :try_start_1
    invoke-virtual {v2, v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v12, "previewTrackUri"

    invoke-virtual {v2, v12, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v8, v0, v12}, Lcom/melodix/music/PreviewPlayerController;->fetchCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    iput-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 326
    :cond_1
    :goto_1
    if-eqz v8, :cond_a

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_2

    if-eqz p9, :cond_a

    :cond_2
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_a

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_a

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v0, :cond_3

    goto/16 :goto_5

    .line 327
    :cond_3
    const-string v0, "previewObservedAtMs"

    const-wide/16 v12, -0x1

    invoke-virtual {v2, v0, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 329
    new-instance v10, Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-direct {v10}, Lcom/melodix/music/PreviewLastTrackStore$Record;-><init>()V

    .line 330
    iput-object v3, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    iput-object v4, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    iput-object v5, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    move-wide/from16 v3, p5

    iput-wide v3, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    iput-wide v6, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    iput-wide v12, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    .line 331
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v10, v3, v4}, Lcom/melodix/music/PreviewLastTrackStore;->valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z

    move-result v3

    if-nez v3, :cond_4

    return-void

    .line 332
    :cond_4
    const v3, 0x7f090244

    invoke-virtual {v8, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 334
    if-nez p9, :cond_5

    invoke-virtual {v2, v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    instance-of v2, v3, Landroid/widget/ImageView;

    if-eqz v2, :cond_5

    .line 335
    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 336
    instance-of v3, v2, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v3, :cond_5

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_2

    .line 338
    :cond_5
    const/4 v2, 0x0

    :goto_2
    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 339
    if-eqz v3, :cond_7

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    iget-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    const-wide/16 v11, 0x0

    cmp-long v4, v6, v11

    if-ltz v4, :cond_7

    iget-wide v6, v1, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    sub-long v6, v14, v6

    const-wide/16 v11, 0x1388

    cmp-long v4, v6, v11

    if-gez v4, :cond_7

    if-eqz v2, :cond_6

    iget-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    if-eqz v4, :cond_7

    .line 340
    :cond_6
    return-void

    .line 341
    :cond_7
    if-nez v2, :cond_9

    if-eqz v3, :cond_8

    iget-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    if-eqz v3, :cond_8

    goto :goto_3

    :cond_8
    const/4 v3, 0x0

    goto :goto_4

    :cond_9
    :goto_3
    const/4 v3, 0x1

    :goto_4
    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedHadArtwork:Z

    .line 342
    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    iput-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    iput-wide v14, v1, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 343
    invoke-static {v8, v10, v2}, Lcom/melodix/music/PreviewLastTrackStore;->save(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V

    .line 344
    return-void

    .line 326
    :cond_a
    :goto_5
    return-void
.end method

.method private scheduleFrame()V
    .locals 2

    .line 745
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

    .line 746
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 3

    .line 655
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 656
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

.method private static setIfDifferent(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 561
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 562
    instance-of p1, p0, Landroid/widget/TextView;

    if-eqz p1, :cond_0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 563
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 1

    .line 613
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 614
    instance-of p2, p1, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_1

    .line 615
    check-cast p1, Landroid/widget/ProgressBar;

    .line 616
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    move-result p2

    const/16 v0, 0x3e8

    if-eq p2, v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 617
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p2

    if-eq p2, p3, :cond_1

    invoke-virtual {p1, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 619
    :cond_1
    return-void
.end method

.method static shelves(Ljava/lang/String;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 481
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 482
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v3, "section"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 483
    :cond_1
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0
.end method

.method private stopGlow(I)V
    .locals 3

    .line 681
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v0, p1

    .line 682
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

    .line 683
    :cond_1
    return-void
.end method

.method static storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 6

    .line 443
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 444
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 445
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 446
    :cond_0
    const-string v3, "id"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "uri"

    invoke-virtual {v2, v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 447
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

    .line 448
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

    .line 444
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 450
    :cond_3
    return-object v0
.end method

.method private storeRows(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 11

    .line 486
    const-string v0, "#t"

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 487
    if-eqz v1, :cond_7

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto/16 :goto_4

    .line 488
    :cond_0
    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-nez p2, :cond_1

    return-void

    .line 490
    :cond_1
    :try_start_0
    const-string p2, "melodix_playlists"

    const/4 v3, 0x0

    invoke-virtual {v1, p2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    .line 491
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

    .line 492
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 493
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

    .line 494
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/16 v4, 0x1e

    if-lt v2, v4, :cond_6

    .line 495
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 496
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

    .line 497
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

    .line 498
    goto :goto_1

    .line 499
    :cond_6
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 500
    :catch_0
    move-exception p1

    :goto_3
    nop

    .line 501
    return-void

    .line 487
    :cond_7
    :goto_4
    return-void
.end method

.method private syncGlow()V
    .locals 8

    .line 685
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 686
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

    .line 687
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v5

    .line 688
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

    .line 689
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

    .line 690
    :goto_2
    const v1, 0x7f09024d

    const v2, 0x7f09023d

    filled-new-array {v1, v2}, [I

    move-result-object v1

    .line 691
    nop

    :goto_3
    const/4 v2, 0x2

    if-ge v3, v2, :cond_7

    .line 692
    const/4 v5, 0x0

    if-nez v0, :cond_3

    move-object v6, v5

    goto :goto_4

    :cond_3
    aget v6, v1, v3

    invoke-virtual {v0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 693
    :goto_4
    nop

    .line 694
    if-eqz v4, :cond_4

    instance-of v7, v6, Landroid/widget/ProgressBar;

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 695
    check-cast v6, Landroid/widget/ProgressBar;

    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 696
    instance-of v7, v6, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v7, :cond_4

    .line 697
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 698
    check-cast v6, Landroid/graphics/drawable/LayerDrawable;

    const v5, 0x102000d

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 701
    :cond_4
    if-nez v5, :cond_5

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    goto :goto_5

    .line 702
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

    .line 703
    :cond_6
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 704
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v5, v6, v3

    .line 705
    const/16 v6, 0x96

    const/16 v7, 0xff

    filled-new-array {v6, v7}, [I

    move-result-object v6

    const-string v7, "alpha"

    invoke-static {v5, v7, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 706
    const-wide/16 v6, 0x640

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 707
    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 708
    const/4 v2, -0x1

    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 709
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v5, v2, v3

    .line 710
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 691
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 712
    :cond_7
    return-void
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 569
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 570
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 571
    :cond_0
    return-void
.end method


# virtual methods
.method public acceptPlayerPayload(Ljava/lang/String;)Z
    .locals 18

    .line 292
    move-object/from16 v1, p0

    const-string v0, ""

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    const/4 v3, 0x1

    if-nez v2, :cond_0

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-nez v2, :cond_0

    return v3

    .line 293
    :cond_0
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    const/4 v4, 0x0

    if-nez v2, :cond_1

    return v4

    .line 295
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    move-object/from16 v5, p1

    invoke-direct {v2, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 296
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

    .line 297
    const-string v7, "previewPositionMs"

    const-wide/16 v8, -0x1

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-string v7, "previewDurationMs"

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 298
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-string v7, "previewObservedAtMs"

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v16

    sub-long v14, v14, v16

    .line 299
    const-string v7, "previewProgressValid"

    invoke-virtual {v2, v7, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    const-wide/16 v16, 0x0

    cmp-long v2, v12, v16

    if-lez v2, :cond_9

    cmp-long v2, v10, v16

    if-ltz v2, :cond_9

    cmp-long v2, v10, v12

    if-gtz v2, :cond_9

    cmp-long v2, v14, v16

    if-ltz v2, :cond_9

    const-wide/16 v10, 0xbb8

    cmp-long v2, v14, v10

    if-gez v2, :cond_9

    const-string v2, "playing"

    .line 301
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "paused"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_3

    .line 304
    :cond_2
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v2, :cond_5

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 305
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "\n"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveKey:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveAt:J

    return v4

    .line 307
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    iget-wide v10, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveAt:J

    sub-long/2addr v5, v10

    const-wide/16 v10, 0x5dc

    cmp-long v0, v5, v10

    if-gez v0, :cond_5

    return v4

    .line 309
    :cond_5
    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 310
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v0, :cond_8

    .line 311
    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 312
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v2, 0x0

    if-nez v0, :cond_6

    move-object v0, v2

    goto :goto_0

    :cond_6
    const v5, 0x7f09023a

    invoke-virtual {v0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 313
    :goto_0
    if-nez v0, :cond_7

    :goto_1
    goto :goto_2

    :cond_7
    const-string v2, "previewPlayerDragHandle"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    goto :goto_1

    .line 314
    :goto_2
    instance-of v0, v2, Landroid/widget/TextView;

    if-eqz v0, :cond_8

    check-cast v2, Landroid/widget/TextView;

    const-string v0, "LECTURE EN COURS"

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    :cond_8
    return v3

    .line 301
    :cond_9
    :goto_3
    return v4

    .line 317
    :catch_0
    move-exception v0

    return v4
.end method

.method public activityCreated()V
    .locals 4

    .line 218
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    return-void

    .line 219
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 222
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_2

    .line 224
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 225
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

    .line 226
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :cond_1
    :goto_0
    nop

    .line 228
    :cond_2
    return-void
.end method

.method public activityPaused()V
    .locals 1

    .line 621
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 13

    .line 636
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 637
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    const-wide/16 v6, -0x1

    if-gez v2, :cond_0

    move-wide v2, v6

    goto :goto_0

    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    :goto_0
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    .line 638
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v2, 0x0

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 639
    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    cmp-long v3, v8, v4

    const/4 v8, 0x1

    if-ltz v3, :cond_1

    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sub-long v9, v0, v9

    const-wide/16 v11, 0x9c4

    cmp-long v3, v9, v11

    if-gez v3, :cond_1

    move v3, v8

    goto :goto_1

    :cond_1
    move v3, v2

    .line 641
    :goto_1
    const/4 v9, 0x0

    if-eqz v3, :cond_2

    sget-object v10, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    if-eqz v10, :cond_2

    sget-object v10, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    sput-object v9, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-virtual {p0, v10}, Lcom/melodix/music/PreviewPlayerController;->snapshot(Ljava/lang/String;)V

    .line 643
    :cond_2
    iget-boolean v10, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v10, :cond_3

    sget-boolean v10, Lcom/melodix/music/PreviewPlayerController;->bgPlaying:Z

    if-eqz v10, :cond_3

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_3

    .line 644
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 645
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->bgPos:J

    sget-wide v10, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sub-long v10, v0, v10

    add-long/2addr v2, v10

    long-to-double v2, v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 646
    const-string v2, "playing"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 647
    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 648
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "retour : lecture observ\u00e9e en arri\u00e8re-plan il y a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-wide v10, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sub-long/2addr v0, v10

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ms ; affich\u00e9e \u00e0 l\'instant"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 650
    :cond_3
    sput-wide v6, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sput-object v9, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 651
    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 652
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResume ; absence="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    cmp-long v1, v1, v4

    if-gez v1, :cond_4

    const-string v1, "inconnue"

    goto :goto_2

    :cond_4
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

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 653
    return-void
.end method

.method public activityStarted()V
    .locals 1

    .line 620
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 1

    .line 676
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    const-string v0, "onStop (sans onPause observ\u00e9)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    .line 677
    :cond_0
    const-string v0, "onStop ; position fig\u00e9e ; signal audio natif=non lu (incertain)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 678
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 679
    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .line 1023
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$9;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$9;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1026
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

    .line 1003
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 1004
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 1007
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    :cond_0
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz p1, :cond_1

    .line 1008
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

    .line 1009
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    const p1, 0x3ee66666    # 0.45f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 1010
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1012
    :cond_1
    return-void
.end method

.method public clearLastTrack()V
    .locals 3

    .line 408
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/melodix/music/PreviewLastTrackStore;->clear(Landroid/content/Context;)V

    const-string v2, "preview_cover"

    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "k"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "u"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 409
    :cond_0
    const-string v0, "forgetHome"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->callStyler(Ljava/lang/String;)V

    .line 410
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 411
    sput-boolean v1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    sput-boolean v1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 412
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 413
    return-void
.end method

.method public command()V
    .locals 4

    .line 1021
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

    .line 748
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 749
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    .line 750
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 751
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    const-wide/16 v2, 0x0

    if-eqz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    .line 752
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 753
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v0

    if-gtz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v4, v0, v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 755
    :cond_1
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz p2, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_2

    .line 756
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 758
    :cond_2
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 759
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_3

    return-void

    .line 760
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 761
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

    .line 762
    :cond_6
    return-void
.end method

.method fetchCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 365
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 366
    :cond_0
    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 367
    const-string v0, "preview_cover"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "k"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerController;->restoreCover(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 368
    :cond_1
    const-string v0, "^spotify:track:([A-Za-z0-9]{22})$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v1, ""

    if-nez p3, :cond_2

    move-object p3, v1

    :cond_2
    invoke-virtual {v0, p3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p3

    .line 369
    invoke-virtual {p3}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "track/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->oembed(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 371
    :cond_3
    iget-object p3, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {p3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/webkit/WebView;

    if-nez p3, :cond_4

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    return-void

    .line 373
    :cond_4
    :try_start_0
    const-string v0, "(function(){try{var a=document.querySelector(\'[data-testid=\"now-playing-widget\"] a[href*=\"/album/\"],[data-testid=\"now-playing-widget-v2\"] a[href*=\"/album/\"],[data-testid=\"now-playing-bar\"] a[href*=\"/album/\"]\');var m=a&&String(a.getAttribute(\'href\')).match(/\\/album\\/([A-Za-z0-9]{22})/);return m?m[1]:\'\'}catch(e){return \'\'}})()"

    new-instance v2, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v2, p0, p2, p1}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {p3, v0, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 378
    goto :goto_0

    :catchall_0
    move-exception p1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 379
    :goto_0
    return-void
.end method

.method keepHome(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 476
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    .line 477
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->homeRows:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3a98

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->shelves(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->homeRows:Ljava/lang/String;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->shelves(Ljava/lang/String;)I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->homeRows:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 478
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->homeRows:Ljava/lang/String;

    return-object p1
.end method

.method public keepRows(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 456
    const-string v0, ""

    const-string v1, "id"

    const-string v2, "uri"

    const-string v3, "home"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p3}, Lcom/melodix/music/PreviewPlayerController;->keepHome(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 458
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 459
    if-eqz v3, :cond_7

    const-string v4, "detail"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    const-wide/16 v6, 0x0

    cmp-long p1, v4, v6

    if-ltz p1, :cond_7

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long/2addr v4, v6

    const-wide/32 v6, 0x1d4c0

    cmp-long p1, v4, v6

    if-lez p1, :cond_1

    goto :goto_2

    .line 460
    :cond_1
    const-string p1, "melodix_playlists"

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v3, 0x0

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 461
    if-nez p1, :cond_2

    return-object p3

    .line 462
    :cond_2
    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p1

    .line 463
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v3, v5, :cond_3

    return-object p3

    .line 464
    :cond_3
    nop

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v4, v3, :cond_6

    .line 465
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 466
    if-eqz v3, :cond_5

    if-eqz v5, :cond_5

    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_1

    .line 464
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 466
    :cond_5
    :goto_1
    return-object p3

    .line 468
    :cond_6
    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 459
    :cond_7
    :goto_2
    return-object p3

    .line 469
    :catch_0
    move-exception p1

    return-object p3
.end method

.method public layoutReady()V
    .locals 3

    .line 242
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 243
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    .line 245
    new-instance v1, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewLastTrackStore;->load(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Callback;)V

    .line 281
    const-string v0, "restoreHome"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->callStyler(Ljava/lang/String;)V

    .line 282
    return-void
.end method

.method public loadState(Ljava/lang/String;)V
    .locals 4

    .line 192
    if-eqz p1, :cond_3

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 193
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 194
    const-string v0, "waiting-bridge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    .line 195
    :cond_1
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    return-void

    .line 197
    :cond_2
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 198
    return-void

    .line 192
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

    .line 204
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_8

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 205
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 206
    const-string v4, "rows-received"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    goto/16 :goto_0

    .line 207
    :cond_1
    const-string v4, "liked-route-other"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string p1, "page diff\u00e9rente"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 208
    :cond_2
    const-string v4, "liked-dom-empty"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string p1, "page lik\u00e9s vue, aucune ligne DOM observ\u00e9e"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 209
    :cond_3
    const-string v4, "liked-dom-rows"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string p1, "page lik\u00e9s vue, lignes DOM pr\u00e9sentes"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    goto :goto_0

    .line 210
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

    .line 211
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

    .line 212
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

    .line 213
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    .line 214
    :cond_7
    :goto_0
    return-void

    .line 204
    :cond_8
    :goto_1
    return-void
.end method

.method public playlistOpened(Ljava/lang/String;)V
    .locals 4

    .line 415
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 416
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

    .line 417
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

    .line 418
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 419
    if-eqz p1, :cond_2

    const-string v1, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 420
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 422
    :cond_2
    return-void
.end method

.method rememberCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 349
    const-string v0, "https://"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 350
    :cond_0
    const-string v0, "preview_cover"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 351
    const-string v0, "u"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "k"

    if-eqz v2, :cond_1

    invoke-interface {p1, v3, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, v3, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, v0, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 352
    :cond_2
    return-void
.end method

.method restoreCover(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 353
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerController;->restoreCoverNow(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    :goto_0
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 503
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

    .line 504
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

    .line 505
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

    .line 507
    :try_start_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 508
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-lez p2, :cond_2

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    iget p3, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez p3, :cond_2

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    .line 509
    :cond_2
    const/4 p2, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-ge p2, p3, :cond_5

    .line 510
    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p3

    .line 511
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

    .line 512
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long p1, p1, v2

    if-gez p1, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 513
    :cond_3
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 514
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 509
    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 517
    :catch_1
    move-exception p1

    :cond_5
    :goto_2
    nop

    .line 519
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 520
    return-void
.end method

.method public run()V
    .locals 12

    .line 658
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 659
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 660
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 661
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 662
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

    .line 663
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

    .line 664
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

    .line 665
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v6

    .line 666
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

    .line 667
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 668
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

    .line 669
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

    .line 671
    :cond_5
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 672
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_6

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 673
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 674
    return-void

    .line 659
    :cond_7
    :goto_3
    return-void
.end method

.method public showDiagnostics()V
    .locals 4

    .line 1146
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 1147
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 1148
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$11;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$11;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    .line 1149
    const-string v0, "Copier"

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1154
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1155
    return-void
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 52

    .line 770
    move-object/from16 v11, p0

    move-object/from16 v0, p1

    const-string v1, "range"

    const-string v2, "none"

    const-string v3, "previewPlaybackState"

    const-string v4, "previewProgressValid"

    const-string v5, "playing"

    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 771
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v8

    .line 772
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v10, "artist"

    const-string v15, "track"

    const-string v12, ""

    move-object/from16 v16, v15

    const-wide/16 v14, -0x1

    if-nez v7, :cond_4

    .line 773
    :try_start_1
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    const-string v0, "callback legacy ignor\u00e9 en arri\u00e8re-plan"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void

    .line 777
    :cond_0
    move-object/from16 v7, v16

    invoke-virtual {v6, v7, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 780
    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_2

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 781
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 782
    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    iput-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    goto :goto_0

    .line 783
    :cond_2
    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_3

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iput-object v1, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 784
    :cond_3
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 785
    return-void

    .line 787
    :cond_4
    move-object/from16 v7, v16

    invoke-virtual {v6, v7, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 788
    const-string v13, "previewTrackUri"

    invoke-virtual {v6, v13, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 789
    const-string v14, "previewPositionMs"

    move-object/from16 v20, v12

    move-object/from16 v19, v13

    const-wide/16 v12, -0x1

    invoke-virtual {v6, v14, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v14

    const-string v12, "previewDurationMs"

    move-object/from16 v21, v1

    const-wide/16 v0, -0x1

    invoke-virtual {v6, v12, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 790
    const/4 v1, 0x0

    invoke-virtual {v6, v5, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-wide/from16 v22, v14

    move-wide v13, v12

    move-object/from16 v12, v19

    const-string v15, "paused"

    if-eqz v0, :cond_5

    move-object v0, v5

    goto :goto_1

    :cond_5
    move-object v0, v15

    :goto_1
    :try_start_2
    invoke-virtual {v6, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 791
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const-string v1, "unknown"

    if-nez v16, :cond_6

    :try_start_3
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_6

    move-object v0, v1

    .line 793
    :cond_6
    invoke-virtual {v6, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 794
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_7

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_7

    move-object v15, v1

    goto :goto_2

    .line 795
    :cond_7
    move-object v15, v3

    :goto_2
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 796
    const/4 v3, 0x0

    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    move-object/from16 v24, v0

    move-object/from16 v19, v1

    const-wide/16 v0, 0x0

    if-eqz v4, :cond_8

    cmp-long v4, v13, v0

    if-lez v4, :cond_8

    cmp-long v4, v22, v0

    if-ltz v4, :cond_8

    cmp-long v4, v22, v13

    if-gtz v4, :cond_8

    const/4 v4, 0x1

    goto :goto_3

    :cond_8
    const/4 v4, 0x0

    .line 797
    :goto_3
    invoke-static {v7}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_9

    invoke-static {v10}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_9

    cmp-long v25, v13, v0

    if-lez v25, :cond_9

    const/16 v25, 0x1

    goto :goto_4

    :cond_9
    const/16 v25, 0x0

    .line 799
    :goto_4
    if-eqz v25, :cond_b

    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_a

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 800
    invoke-static {v3, v10}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v0, v0, v13

    if-eqz v0, :cond_b

    :cond_a
    const/4 v0, 0x1

    goto :goto_5

    :cond_b
    const/4 v0, 0x0

    .line 801
    :goto_5
    move-object/from16 v28, v12

    move-wide/from16 v29, v13

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    cmp-long v1, v12, v8

    if-lez v1, :cond_d

    .line 803
    if-eqz v0, :cond_c

    const-wide/16 v12, -0x1

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    iget-object v1, v11, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v11, v1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    goto :goto_6

    .line 804
    :cond_c
    if-eqz v25, :cond_d

    return-void

    .line 806
    :cond_d
    :goto_6
    invoke-direct {v11, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v12

    .line 807
    if-nez v0, :cond_e

    if-eqz v4, :cond_e

    move-wide/from16 v31, v12

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v26, 0x0

    cmp-long v1, v12, v26

    if-ltz v1, :cond_f

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v33, 0x7d0

    sub-long v12, v12, v33

    cmp-long v1, v22, v12

    if-gez v1, :cond_f

    const/4 v13, 0x1

    goto :goto_7

    :cond_e
    move-wide/from16 v31, v12

    :cond_f
    const/4 v13, 0x0

    .line 808
    :goto_7
    if-eqz v4, :cond_10

    if-nez v0, :cond_10

    if-nez v13, :cond_10

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v26, 0x0

    cmp-long v1, v12, v26

    if-ltz v1, :cond_10

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v1, v22, v12

    if-eqz v1, :cond_10

    .line 809
    :cond_10
    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v1, :cond_11

    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v1, :cond_11

    if-eqz v5, :cond_11

    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_11

    if-nez v0, :cond_11

    const/4 v13, 0x1

    goto :goto_8

    :cond_11
    const/4 v13, 0x0

    .line 810
    :goto_8
    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 811
    const-string v3, "previewProgressSource"

    invoke-virtual {v6, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 812
    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v12, v21

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v14, "media"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v14, "clock"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    iput-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 815
    :cond_12
    const-string v2, "previewObservedAtMs"

    move v3, v13

    const-wide/16 v13, -0x1

    invoke-virtual {v6, v2, v13, v14}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v33

    .line 816
    const-wide/16 v13, 0x0

    cmp-long v2, v33, v13

    if-gez v2, :cond_13

    const-wide/16 v13, -0x1

    goto :goto_9

    :cond_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    sub-long v13, v13, v33

    .line 817
    :goto_9
    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->foreground:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v21, v12

    const-string v12, " ms ; \u00e2ge observation="

    move/from16 v33, v0

    const-string v0, "mesure="

    const-string v34, "inconnu"

    move-object/from16 v35, v15

    const-string v15, " ms"

    const-wide/16 v36, 0xbb8

    if-nez v2, :cond_16

    .line 821
    if-eqz v4, :cond_14

    if-eqz v25, :cond_14

    const-wide/16 v1, 0x0

    cmp-long v3, v13, v1

    if-ltz v3, :cond_14

    cmp-long v3, v13, v36

    if-gez v3, :cond_14

    .line 822
    :try_start_4
    sput-wide v22, Lcom/melodix/music/PreviewPlayerController;->bgPos:J

    sput-wide v8, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sput-boolean v5, Lcom/melodix/music/PreviewPlayerController;->bgPlaying:Z

    sput-object p1, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 823
    const/16 v17, 0x1

    move-wide v8, v1

    move-object/from16 v1, p0

    move-object v2, v6

    move-object v3, v7

    move-object v4, v10

    move-object/from16 v5, v24

    move-wide/from16 v6, v22

    move-wide/from16 v8, v29

    move/from16 v10, v17

    invoke-direct/range {v1 .. v10}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJZ)V

    goto :goto_a

    .line 824
    :cond_14
    const-wide/16 v1, -0x1

    sput-wide v1, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    const/4 v1, 0x0

    sput-object v1, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 825
    :goto_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v1, 0x0

    cmp-long v1, v13, v1

    if-gez v1, :cond_15

    :goto_b
    move-object/from16 v1, v34

    goto :goto_c

    :cond_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    goto :goto_b

    :goto_c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; \u00e9tat page="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v2, v35

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; rejet\u00e9e : arri\u00e8re-plan ; signal audio natif=non lu"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 827
    return-void

    .line 829
    :cond_16
    move/from16 v26, v1

    const-wide/16 v1, 0x0

    move-wide/from16 v50, v22

    move-object/from16 v22, v6

    move-object/from16 v23, v7

    move-wide/from16 v6, v50

    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v27

    const-wide/high16 v38, 0x7ff8000000000000L    # Double.NaN

    if-eqz v27, :cond_17

    move-wide/from16 v1, v38

    goto :goto_d

    :cond_17
    long-to-double v1, v6

    sub-double v1, v1, v31

    .line 830
    :goto_d
    move/from16 v27, v3

    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v3, :cond_18

    move-object v3, v0

    move-wide/from16 v42, v1

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const-wide/16 v40, 0x0

    cmp-long v0, v0, v40

    if-ltz v0, :cond_19

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v0, v8, v0

    const-wide/16 v44, 0x3e8

    cmp-long v0, v0, v44

    if-ltz v0, :cond_19

    if-eqz v4, :cond_19

    const-wide/16 v0, 0x0

    cmp-long v2, v13, v0

    if-ltz v2, :cond_19

    cmp-long v0, v13, v36

    if-gez v0, :cond_19

    if-eqz v25, :cond_19

    .line 831
    move-object/from16 v1, v19

    move-object/from16 v0, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    const/4 v2, 0x1

    goto :goto_e

    .line 830
    :cond_18
    move-object v3, v0

    move-wide/from16 v42, v1

    :cond_19
    move-object/from16 v1, v19

    move-object/from16 v0, v24

    .line 831
    :cond_1a
    const/4 v2, 0x0

    .line 835
    :goto_e
    if-eqz v4, :cond_1c

    const-wide/16 v40, 0x0

    cmp-long v19, v13, v40

    if-ltz v19, :cond_1c

    cmp-long v19, v13, v36

    if-gez v19, :cond_1c

    move-object/from16 v24, v0

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_1d

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_1d

    if-eqz v25, :cond_1d

    if-nez v33, :cond_1d

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1d

    if-eqz v5, :cond_1d

    const-wide/16 v44, 0x2710

    cmp-long v0, v29, v44

    if-ltz v0, :cond_1d

    .line 837
    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1b

    move-object/from16 v19, v1

    sub-long v0, v29, v36

    long-to-double v0, v0

    cmpl-double v0, v31, v0

    if-ltz v0, :cond_1e

    cmp-long v0, v6, v36

    if-gtz v0, :cond_1e

    const/4 v0, 0x1

    goto :goto_10

    :cond_1b
    move-object/from16 v19, v1

    goto :goto_f

    .line 835
    :cond_1c
    move-object/from16 v24, v0

    :cond_1d
    move-object/from16 v19, v1

    .line 837
    :cond_1e
    :goto_f
    const/4 v0, 0x0

    .line 838
    :goto_10
    iget-object v1, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v44, v5

    move-object/from16 v5, v21

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-wide/16 v45, 0x1388

    if-eqz v1, :cond_1f

    const-wide/16 v47, 0x1f40

    move-wide/from16 v50, v8

    move-wide/from16 v8, v47

    move-wide/from16 v47, v50

    goto :goto_11

    :cond_1f
    move-wide/from16 v47, v8

    move-wide/from16 v8, v45

    .line 839
    :goto_11
    if-nez v4, :cond_20

    const-string v1, "invalide"

    goto :goto_12

    :cond_20
    const-wide/16 v4, 0x0

    cmp-long v1, v13, v4

    if-gez v1, :cond_21

    const-string v1, "\u00e2ge inconnu"

    goto :goto_12

    .line 840
    :cond_21
    cmp-long v1, v13, v36

    if-ltz v1, :cond_22

    const-string v1, "observation ancienne"

    goto :goto_12

    .line 841
    :cond_22
    if-nez v25, :cond_23

    const-string v1, "identit\u00e9 incompl\u00e8te"

    goto :goto_12

    .line 842
    :cond_23
    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v1, :cond_24

    if-nez v2, :cond_24

    const-string v1, "attente retour 1 s"

    goto :goto_12

    .line 843
    :cond_24
    if-nez v0, :cond_25

    if-nez v2, :cond_25

    if-nez v33, :cond_25

    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_25

    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v1, :cond_25

    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_25

    long-to-double v4, v6

    sub-double v4, v4, v31

    .line 844
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    long-to-double v8, v8

    cmpl-double v1, v4, v8

    if-ltz v1, :cond_25

    const-string v1, "\u00e9cart >= seuil"

    goto :goto_12

    :cond_25
    move-object/from16 v1, v20

    .line 847
    :goto_12
    const-string v4, "\u00e9cart >= seuil"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 848
    const-wide/16 v4, 0x0

    cmpl-double v8, v42, v4

    if-lez v8, :cond_26

    const/4 v4, 0x1

    goto :goto_13

    :cond_26
    const/4 v4, -0x1

    .line 849
    :goto_13
    iget-wide v8, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const-wide/16 v36, 0x0

    cmp-long v5, v8, v36

    if-ltz v5, :cond_28

    iget-wide v8, v11, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    sub-long v8, v47, v8

    cmp-long v5, v8, v45

    if-gtz v5, :cond_28

    iget v5, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    if-ne v4, v5, :cond_28

    iget-object v5, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iget-object v8, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_27

    goto :goto_14

    :cond_27
    move-wide/from16 v8, v47

    goto :goto_15

    .line 850
    :cond_28
    :goto_14
    move-wide/from16 v8, v47

    iput-wide v8, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const/4 v5, 0x0

    iput v5, v11, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    iput v4, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    iget-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iput-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 852
    :goto_15
    iput-wide v8, v11, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    iget v4, v11, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/16 v16, 0x1

    add-int/lit8 v4, v4, 0x1

    iput v4, v11, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    .line 853
    iget-boolean v4, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v4, :cond_2a

    iget v4, v11, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v5, 0x3

    if-lt v4, v5, :cond_2a

    iget-wide v4, v11, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    sub-long v4, v8, v4

    const-wide/16 v36, 0x2710

    cmp-long v4, v4, v36

    if-ltz v4, :cond_2a

    .line 854
    move-wide/from16 v4, v31

    iput-wide v4, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v8, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    move-wide/from16 v47, v8

    long-to-double v8, v6

    sub-double/2addr v8, v4

    iput-wide v8, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 855
    iget-boolean v8, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v8, :cond_29

    const/4 v8, 0x0

    iput-boolean v8, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 856
    :cond_29
    const/4 v9, 0x1

    iput-boolean v9, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 857
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "resynchronisation douce ; \u00e9cart r\u00e9p\u00e9t\u00e9="

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-wide/from16 v31, v4

    move-object/from16 v21, v10

    move-wide/from16 v4, v42

    double-to-long v9, v4

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v11, v8}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 858
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_16

    .line 853
    :cond_2a
    move-wide/from16 v47, v8

    move-object/from16 v21, v10

    move-wide/from16 v4, v42

    goto :goto_16

    .line 860
    :cond_2b
    move-object/from16 v21, v10

    move-wide/from16 v4, v42

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    :goto_16
    nop

    .line 861
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    .line 862
    nop

    .line 863
    if-eqz v8, :cond_2d

    if-nez v33, :cond_2c

    iget-wide v9, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v36, 0x0

    cmp-long v9, v9, v36

    if-ltz v9, :cond_2c

    iget-wide v9, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v9, v6, v9

    if-eqz v9, :cond_2d

    :cond_2c
    const/4 v9, 0x1

    goto :goto_17

    :cond_2d
    const/4 v9, 0x0

    .line 864
    :goto_17
    iput-boolean v8, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 865
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-wide/16 v36, 0x0

    cmp-long v10, v13, v36

    if-gez v10, :cond_2e

    move-object/from16 v10, v34

    goto :goto_18

    :cond_2e
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    :goto_18
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v10, " ; source="

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v10, " ; \u00e9tat page="

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v10, v35

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v10, " ; \u00e9cart="

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 866
    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v10

    if-eqz v10, :cond_2f

    :goto_19
    move-object/from16 v4, v34

    goto :goto_1a

    :cond_2f
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    double-to-long v4, v4

    invoke-virtual {v10, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    goto :goto_19

    :goto_1a
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 867
    if-eqz v8, :cond_30

    const-string v4, "accept\u00e9e"

    goto :goto_1b

    :cond_30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "rejet\u00e9e : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_1b
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 865
    invoke-direct {v11, v3}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 868
    if-eqz v33, :cond_33

    .line 869
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v3, -0x1

    iput-wide v3, v11, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    iput-wide v3, v11, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 870
    const/4 v3, 0x0

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 871
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    const-wide/16 v4, -0x1

    iput-wide v4, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v4, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 873
    iget-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v5, v23

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31

    iget-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v10, v21

    invoke-static {v4, v10}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_32

    goto :goto_1c

    :cond_31
    move-object/from16 v10, v21

    :goto_1c
    const-wide/16 v12, -0x1

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    move-object/from16 v4, v20

    iput-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 875
    :cond_32
    move-wide/from16 v12, v38

    goto :goto_1d

    .line 868
    :cond_33
    move-object/from16 v10, v21

    move-object/from16 v5, v23

    move-wide/from16 v12, v31

    .line 875
    :goto_1d
    if-eqz v25, :cond_34

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v14, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-le v4, v14, :cond_34

    iget-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v4, v10}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_34

    iput-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 876
    :cond_34
    if-eqz v25, :cond_35

    iput-object v5, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-wide/from16 v14, v29

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v4, 0x1

    iput-boolean v4, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    goto :goto_1e

    :cond_35
    move-wide/from16 v14, v29

    .line 877
    :goto_1e
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_37

    if-eqz v33, :cond_36

    goto :goto_1f

    :cond_36
    move-object/from16 v4, v28

    goto :goto_20

    :cond_37
    :goto_1f
    move-object/from16 v4, v28

    iput-object v4, v11, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 880
    :goto_20
    const-string v3, "previewConfirmPositionMs"

    move-object/from16 v28, v4

    move/from16 p1, v9

    move-object/from16 v21, v10

    move-object/from16 v4, v22

    move-wide/from16 v22, v6

    const-wide/16 v6, -0x1

    invoke-virtual {v4, v3, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v9

    .line 881
    if-eqz v25, :cond_39

    const-wide/16 v6, 0x0

    cmp-long v3, v9, v6

    if-ltz v3, :cond_39

    cmp-long v3, v9, v14

    if-gtz v3, :cond_39

    .line 882
    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v3, :cond_38

    if-nez v33, :cond_38

    iget v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v3, :cond_38

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v6, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v6, v3, v6

    const-wide/16 v29, 0x0

    cmp-long v3, v6, v29

    if-ltz v3, :cond_38

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v6, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v6, v3, v6

    const-wide/16 v29, 0x0

    cmp-long v3, v6, v29

    if-gez v3, :cond_38

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v6, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v6, v3, v6

    cmp-long v3, v9, v6

    if-eqz v3, :cond_38

    .line 884
    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v6, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v47, v3, v6

    .line 885
    :cond_38
    iput-wide v9, v11, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v6, v47

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    goto :goto_21

    .line 881
    :cond_39
    move-wide/from16 v6, v47

    .line 887
    :goto_21
    if-eqz v8, :cond_3a

    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-eqz v3, :cond_3a

    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v3, :cond_3a

    const/4 v3, 0x0

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 888
    :cond_3a
    if-eqz v2, :cond_3b

    if-eqz v8, :cond_3b

    .line 889
    const/4 v3, 0x0

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 890
    const-string v3, "retour confirm\u00e9 par observation coh\u00e9rente ; son non v\u00e9rifi\u00e9"

    invoke-direct {v11, v3}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 892
    :cond_3b
    nop

    .line 893
    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v3, :cond_47

    if-nez v33, :cond_47

    .line 894
    nop

    .line 895
    if-eqz v44, :cond_3c

    move-object/from16 v20, v4

    iget-wide v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v3, v6, v3

    move-wide/from16 v29, v12

    const-wide/16 v12, 0x0

    invoke-static {v12, v13, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    goto :goto_22

    :cond_3c
    move-object/from16 v20, v4

    move-wide/from16 v29, v12

    const-wide/16 v3, 0x0

    .line 896
    :goto_22
    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v12, v3

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 897
    const-wide/16 v12, 0x0

    cmp-long v22, v9, v12

    if-ltz v22, :cond_3d

    cmp-long v12, v9, v14

    if-gtz v12, :cond_3d

    .line 898
    iput-wide v9, v11, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 900
    :cond_3d
    if-ltz v22, :cond_40

    sub-long v3, v9, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    const-wide/16 v12, 0x9c4

    cmp-long v3, v3, v12

    if-lez v3, :cond_3e

    goto :goto_23

    .line 911
    :cond_3e
    iget v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v3, :cond_3f

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v4, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v6, v3, v4

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v4, v11, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v8, "position UI proche de la cible"

    aput-object v8, v3, v4

    .line 912
    :cond_3f
    const/4 v3, 0x0

    iput-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v22, 0x1

    add-long v12, v12, v22

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 913
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    .line 914
    const-wide/16 v12, -0x1

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move v4, v8

    move-wide v12, v9

    move-object/from16 v1, v19

    move-object/from16 v10, v24

    move/from16 v9, v44

    const/16 v16, 0x1

    goto/16 :goto_27

    .line 901
    :cond_40
    :goto_23
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_41

    if-nez v44, :cond_41

    invoke-direct {v11, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 902
    :cond_41
    if-eqz v44, :cond_42

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_42

    const/4 v13, 0x1

    goto :goto_24

    :cond_42
    const/4 v13, 0x0

    :goto_24
    iput-boolean v13, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v0, 0x1

    iput-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 903
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_44

    if-nez v8, :cond_43

    move-object/from16 v1, v19

    move-object/from16 v10, v24

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    goto :goto_25

    :cond_43
    move-object/from16 v1, v19

    move-object/from16 v10, v24

    :goto_25
    iput-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_26

    :cond_44
    move-object/from16 v1, v19

    move-object/from16 v10, v24

    .line 904
    :cond_45
    :goto_26
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_46

    if-eqz v8, :cond_46

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    .line 905
    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    move/from16 v9, v44

    iput-boolean v9, v11, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_46

    iput-boolean v9, v11, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 907
    :cond_46
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void

    .line 893
    :cond_47
    move-object/from16 v20, v4

    move-wide/from16 v29, v12

    move-object/from16 v1, v19

    move-object/from16 v10, v24

    move/from16 v9, v44

    .line 916
    move/from16 v4, p1

    move-wide/from16 v12, v22

    const/16 v16, 0x0

    :goto_27
    if-eqz v8, :cond_5a

    .line 917
    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 918
    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v3, :cond_54

    if-nez v33, :cond_54

    if-nez v0, :cond_54

    invoke-static/range {v29 .. v30}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_48

    move-object/from16 v16, v1

    move/from16 p1, v4

    move-object/from16 v23, v5

    goto/16 :goto_2d

    .line 921
    :cond_48
    if-eqz v2, :cond_4e

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_4e

    .line 924
    if-eqz v9, :cond_4a

    long-to-double v2, v12

    sub-double v2, v2, v29

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v16, 0x40a7700000000000L    # 3000.0

    cmpl-double v0, v2, v16

    if-ltz v0, :cond_49

    goto :goto_28

    :cond_49
    const/4 v0, 0x0

    goto :goto_29

    :cond_4a
    :goto_28
    const/4 v0, 0x1

    .line 925
    :goto_29
    if-eqz v0, :cond_4b

    long-to-double v2, v12

    goto :goto_2a

    :cond_4b
    move-wide/from16 v2, v29

    :goto_2a
    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    if-eqz v0, :cond_4c

    const-wide/16 v2, 0x0

    goto :goto_2b

    :cond_4c
    long-to-double v2, v12

    sub-double v2, v2, v29

    :goto_2b
    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 926
    if-eqz v0, :cond_4d

    const-string v0, "retour : saut"

    goto :goto_2c

    :cond_4d
    const-string v0, "retour : correction <=1,25x"

    :goto_2c
    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 927
    move-object/from16 v16, v1

    move/from16 p1, v4

    move-object/from16 v23, v5

    goto/16 :goto_2e

    :cond_4e
    if-eqz v16, :cond_4f

    if-nez v9, :cond_4f

    .line 928
    long-to-double v2, v14

    move-object/from16 v16, v1

    move-wide/from16 v0, v29

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    move-wide/from16 v29, v14

    const-wide/16 v14, 0x0

    invoke-static {v14, v15, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v2, v12

    sub-double/2addr v2, v0

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    move/from16 p1, v4

    move-object/from16 v23, v5

    move-wide/from16 v14, v29

    goto/16 :goto_2e

    .line 927
    :cond_4f
    move-object/from16 v16, v1

    move-wide/from16 v0, v29

    move-wide/from16 v29, v14

    .line 929
    if-eqz v4, :cond_50

    if-nez v9, :cond_50

    if-nez v27, :cond_50

    .line 930
    move-wide/from16 v14, v29

    long-to-double v2, v14

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    move/from16 p1, v4

    move-object/from16 v23, v5

    goto :goto_2e

    .line 929
    :cond_50
    move-wide/from16 v14, v29

    .line 931
    if-eqz v4, :cond_51

    if-nez v27, :cond_51

    .line 932
    long-to-double v2, v14

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    move/from16 p1, v4

    move-object/from16 v23, v5

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v2, v12

    sub-double/2addr v2, v0

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2e

    .line 931
    :cond_51
    move/from16 p1, v4

    move-object/from16 v23, v5

    .line 933
    if-eqz v26, :cond_52

    if-eqz v9, :cond_53

    if-nez v27, :cond_53

    :cond_52
    if-nez v26, :cond_55

    if-eqz v9, :cond_55

    .line 934
    :cond_53
    long-to-double v2, v14

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_2e

    .line 918
    :cond_54
    move-object/from16 v16, v1

    move/from16 p1, v4

    move-object/from16 v23, v5

    .line 919
    :goto_2d
    long-to-double v1, v12

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 920
    if-eqz v0, :cond_55

    const-string v0, "retour d\u00e9but observ\u00e9 ; lecture non command\u00e9e"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 936
    :cond_55
    :goto_2e
    if-eqz p1, :cond_57

    .line 937
    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_56

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_56

    if-eqz v9, :cond_56

    .line 938
    iget-object v0, v11, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    iget v1, v11, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget-wide v4, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v4, v6, v4

    aput-wide v4, v0, v1

    .line 939
    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v1, v11, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, v11, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 940
    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    iget-object v1, v11, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v1, v1

    if-ge v0, v1, :cond_56

    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, v11, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 942
    :cond_56
    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    goto :goto_2f

    .line 936
    :cond_57
    const-wide/16 v2, 0x0

    .line 944
    :goto_2f
    const/4 v0, 0x1

    iput-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 945
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_58

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_58

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 946
    :cond_58
    if-eqz v25, :cond_59

    if-eqz v9, :cond_59

    if-nez v27, :cond_59

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_59

    const/4 v0, 0x1

    goto :goto_30

    :cond_59
    const/4 v0, 0x0

    :goto_30
    iput-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_32

    .line 947
    :cond_5a
    move-object/from16 v16, v1

    move-object/from16 v23, v5

    move-wide/from16 v0, v29

    const-wide/16 v2, 0x0

    iget-boolean v4, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_5e

    if-nez v33, :cond_5e

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_5e

    .line 948
    if-eqz v9, :cond_5b

    if-eqz v27, :cond_5c

    :cond_5b
    iget-boolean v4, v11, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v4, :cond_5c

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    iput-wide v4, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 949
    :cond_5c
    if-eqz v9, :cond_5d

    if-nez v27, :cond_5d

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_5d

    const/4 v0, 0x1

    goto :goto_31

    :cond_5d
    const/4 v0, 0x0

    :goto_31
    iput-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_32

    .line 950
    :cond_5e
    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 951
    :goto_32
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_60

    if-nez v8, :cond_5f

    move-object/from16 v0, v16

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_61

    goto :goto_33

    :cond_5f
    move-object/from16 v0, v16

    :goto_33
    iput-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_34

    :cond_60
    move-object/from16 v0, v16

    .line 952
    :cond_61
    :goto_34
    const/4 v4, 0x1

    iput-boolean v4, v11, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 953
    iget-boolean v5, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v5, :cond_63

    if-eqz v8, :cond_63

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_63

    .line 954
    iput-wide v6, v11, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    .line 955
    iput-boolean v9, v11, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 956
    iget-boolean v5, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v5, :cond_62

    iget-boolean v5, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-ne v9, v5, :cond_62

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v17, 0x1

    add-long v2, v2, v17

    iput-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 957
    :cond_62
    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v1, :cond_63

    iput-boolean v9, v11, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 959
    :cond_63
    if-eqz v8, :cond_64

    if-eqz v25, :cond_64

    iget-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_64

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_64

    .line 960
    const-wide/16 v17, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    move v8, v4

    move-object/from16 v3, v23

    move-object/from16 v5, v28

    move-object/from16 v4, v21

    move/from16 v49, v9

    move-object v9, v5

    move-object v5, v10

    move-wide/from16 v19, v6

    move-wide v6, v12

    move v12, v8

    move-wide/from16 v47, v19

    move-object/from16 v19, v9

    move-wide v8, v14

    invoke-direct/range {v1 .. v9}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    goto :goto_35

    .line 959
    :cond_64
    move v12, v4

    move-wide/from16 v47, v6

    move/from16 v49, v9

    move-object/from16 v19, v28

    const-wide/16 v17, 0x0

    .line 961
    :goto_35
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 962
    const-string v1, "apr\u00e8s mesure"

    invoke-direct {v11, v1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 963
    iget-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v1, v1, v17

    if-ltz v1, :cond_67

    iget-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    cmp-long v1, v1, v17

    if-ltz v1, :cond_67

    iget-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    cmp-long v1, v1, v17

    if-gez v1, :cond_67

    iget v1, v11, Lcom/melodix/music/PreviewPlayerController;->operation:I

    if-ne v1, v12, :cond_65

    .line 964
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_65

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v1, v49

    if-eq v1, v0, :cond_66

    :cond_65
    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->operation:I

    if-eq v0, v12, :cond_67

    .line 965
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_67

    iget-object v0, v11, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v1, v19

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_67

    .line 966
    :cond_66
    move-wide/from16 v0, v47

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->uiAt:J
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 972
    :cond_67
    goto :goto_37

    .line 968
    :catch_0
    move-exception v0

    .line 969
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {v11, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    .line 970
    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_68

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_68

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_36

    :cond_68
    const/4 v1, 0x0

    .line 971
    :goto_36
    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v0, "mesure rejet\u00e9e : format invalide"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 973
    :goto_37
    return-void
.end method

.method public tapPlayPause()I
    .locals 7

    .line 983
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 984
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

    .line 985
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 986
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 987
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

    .line 989
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

    .line 990
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 991
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 992
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 993
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$7;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$7;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v0, 0x1f40

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1000
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    return v0

    .line 983
    :cond_7
    :goto_1
    return v1
.end method
