.class public final Lcom/melodix/music/PreviewPlayerController;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;
.implements Ljava/lang/Runnable;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/view/View$OnTouchListener;


# static fields
.field static final BRIDGE_MARK:Ljava/lang/String; = "(function(w){if(w.__spotiduck_bridge_applied===true&&typeof w.fetchMediaItems===\'function\'&&w.__sfMelodixBridgeCompleted!==true){w.__sfMelodixBridgeCompleted=true;return 1}return 0})(window)"

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

.field static final PLAYING_COLOR:I = -0xe128a0

.field private static final PLAYLIST_STORE:Ljava/lang/String; = "melodix_playlists"

.field private static final PLAY_ICON:I = 0x7f080122

.field private static final RECONCILE_MS:J = 0x1f40L

.field static final SKIP_HOLD_MS:J = 0xfa0L

.field private static final TRACK_VIEWS:[I

.field private static bgAt:J

.field private static bgJson:Ljava/lang/String;

.field private static bgPlaying:Z

.field private static bgPos:J

.field private static crashHooked:Z

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

.field private bridgeMarkAt:J

.field private bridgeMarks:I

.field private bridgeSeq:I

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

.field private final lit:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;>;"
        }
    .end annotation
.end field

.field private final litColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private litTitle:Ljava/lang/String;

.field private liveObserved:Z

.field private loadStage:Ljava/lang/String;

.field private measureHomeFrame:Z

.field private measurePlaylistFrame:Z

.field private measurementAt:J

.field private measurementPosition:J

.field private menuFns:Ljava/lang/String;

.field private moving:Z

.field private navigationAt:J

.field private onDetail:Z

.field private operation:I

.field private optimisticAt:J

.field private pageFlags:Ljava/lang/String;

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

.field private rowKeys:Ljava/lang/String;

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

    .line 1099
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
    .locals 8

    .line 591
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

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagSubmit:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    new-array v4, v2, [J

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    .line 56
    new-array v4, v2, [Ljava/lang/String;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

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
    const-string v4, "\u2014"

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v5, "Temps restant : \u2014"

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 142
    const-string v5, ""

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 143
    const-string v6, "none"

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 147
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v7, "unknown"

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 149
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 150
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 151
    const/16 v7, 0x78

    new-array v7, v7, [Ljava/lang/String;

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 153
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 154
    const/16 v7, 0x14

    new-array v7, v7, [Ljava/lang/String;

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    const/16 v7, 0xa

    new-array v7, v7, [Ljava/lang/String;

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    .line 156
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    .line 161
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    .line 163
    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 178
    const/4 v6, 0x2

    new-array v7, v6, [Landroid/animation/ObjectAnimator;

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 179
    new-array v6, v6, [Landroid/graphics/drawable/Drawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 181
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 182
    const/16 v6, 0x3c

    new-array v6, v6, [J

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 185
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 189
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

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
    const-string v4, "non observ\u00e9e"

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    .line 215
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 216
    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    .line 237
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 238
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    .line 239
    const-string v2, "non charg\u00e9"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    .line 240
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->pendingLiveKey:Ljava/lang/String;

    .line 393
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 506
    const-string v2, "non relev\u00e9 (rouvrir le diagnostic)"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    .line 507
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    .line 538
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->lit:Ljava/util/List;

    .line 539
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->litColors:Ljava/util/List;

    .line 540
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->litTitle:Ljava/lang/String;

    .line 644
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 784
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$8;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerController$8;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    .line 841
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarkAt:J

    .line 1098
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    .line 1104
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$11;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$11;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    .line 1260
    const-string v0, "non relev\u00e9"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    const-string v0, "aucune ligne vue"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowKeys:Ljava/lang/String;

    .line 592
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 593
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz p1, :cond_0

    .line 594
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 595
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 596
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 597
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 598
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 599
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 600
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 602
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

.method static synthetic access$4408(Lcom/melodix/music/PreviewPlayerController;)I
    .locals 2

    .line 34
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarks:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarks:I

    return v0
.end method

.method static synthetic access$4500(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$4602(Lcom/melodix/music/PreviewPlayerController;J)J
    .locals 0

    .line 34
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    return-wide p1
.end method

.method static synthetic access$4700(Lcom/melodix/music/PreviewPlayerController;F)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    return-void
.end method

.method static synthetic access$4802(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4900(Lcom/melodix/music/PreviewPlayerController;)I
    .locals 0

    .line 34
    iget p0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeSeq:I

    return p0
.end method

.method static synthetic access$4908(Lcom/melodix/music/PreviewPlayerController;)I
    .locals 2

    .line 34
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeSeq:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeSeq:I

    return v0
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    return-wide v0
.end method

.method static synthetic access$5002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$5102(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$5200(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->showDiagnosticsNow()V

    return-void
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

    .line 463
    :try_start_0
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 464
    :cond_0
    const-string v0, "melodix_playlists"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 465
    if-nez p0, :cond_1

    return-object p2

    .line 466
    :cond_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_2

    return-object p2

    .line 467
    :cond_2
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 468
    const-string v0, "title"

    const-string v1, "Copie enregistr\u00e9e"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "subtitle"

    const-string v1, "Actualisation des titres en cours\u2026"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "settingValue"

    const-string v1, "Info"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 469
    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 463
    :cond_3
    :goto_0
    return-object p2

    .line 470
    :catch_0
    move-exception p0

    return-object p2
.end method

.method private callStyler(Ljava/lang/String;)V
    .locals 3

    .line 232
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 233
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

    .line 234
    :catchall_0
    move-exception p1

    :goto_0
    nop

    .line 235
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

    .line 626
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

    .line 627
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

    .line 810
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

    .line 811
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

    .line 286
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 287
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

    .line 288
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/picasso/RequestCreator;->noPlaceholder()Lcom/squareup/picasso/RequestCreator;

    move-result-object v0

    invoke-virtual {v0, p2, p2}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/picasso/RequestCreator;->centerCrop()Lcom/squareup/picasso/RequestCreator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {p0, p1, p2}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 290
    :goto_0
    return-void

    .line 287
    :cond_2
    :goto_1
    invoke-static {p0, p1, p2}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    return-void

    .line 286
    :cond_3
    :goto_2
    return-void
.end method

.method static coverFromOembed(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 432
    const-string v0, "\"thumbnail_url\"\\s*:\\s*\"(https://[^\"\\\\]+)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 433
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 434
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

    .line 435
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

.method static crashCatcher(Landroid/app/Activity;)V
    .locals 5

    .line 296
    const-string v0, "preview_crash"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 297
    const/4 v1, 0x0

    const-string v2, "t"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 298
    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 299
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 300
    const-string v2, "clipboard"

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ClipboardManager;

    const-string v4, "Melodix crash"

    invoke-static {v4, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 301
    const-string v1, "Erreur du dernier crash copi\u00e9e : colle-la \u00e0 Claude"

    invoke-static {p0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 303
    :cond_0
    sget-boolean p0, Lcom/melodix/music/PreviewPlayerController;->crashHooked:Z

    if-eqz p0, :cond_1

    return-void

    .line 304
    :cond_1
    sput-boolean v3, Lcom/melodix/music/PreviewPlayerController;->crashHooked:Z

    .line 305
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p0

    .line 306
    new-instance v1, Lcom/melodix/music/PreviewPlayerController$4;

    invoke-direct {v1, v0, p0}, Lcom/melodix/music/PreviewPlayerController$4;-><init>(Landroid/content/SharedPreferences;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 310
    return-void
.end method

.method static crashTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 7

    .line 312
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Melodix crash"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-eqz p0, :cond_2

    const/4 v3, 0x5

    if-ge v2, v3, :cond_2

    .line 314
    if-nez v2, :cond_0

    const-string v3, "\n"

    goto :goto_1

    :cond_0
    const-string v3, "\nCause : "

    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 316
    move v4, v1

    :goto_2
    array-length v5, v3

    if-ge v4, v5, :cond_1

    const/16 v5, 0x19

    if-ge v4, v5, :cond_1

    const-string v5, "\n  at "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v4

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v4

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3a

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v4

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 313
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 318
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private delta(J)Ljava/lang/String;
    .locals 4

    .line 1111
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

    .line 1101
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 1102
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

    .line 1103
    :cond_2
    return-void
.end method

.method private dominantPhase()Ljava/lang/String;
    .locals 18

    .line 1129
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

    .line 1131
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

    .line 1132
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

    .line 1133
    const-string v1, "r\u00e9ception \u2192 rendu natif"

    const-string v2, "rendu \u2192 frame"

    const-string v8, "attente pont"

    const-string v9, "navigation \u2192 page pr\u00eate"

    const-string v10, "page/pont \u2192 lignes re\u00e7ues"

    filled-new-array {v8, v9, v10, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 1134
    nop

    .line 1135
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

    .line 1136
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

    .line 1130
    :cond_5
    :goto_3
    const-string v1, "ind\u00e9termin\u00e9e (phases manquantes ou non s\u00e9quentielles)"

    return-object v1
.end method

.method static flagsSetTrue(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1279
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 1280
    const-string v1, "window\\.(__sf[A-Za-z0-9_]*)\\s*=\\s*(?:!0|true)\\b"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 1281
    :goto_0
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/util/TreeSet;->size()I

    move-result v1

    const/16 v2, 0x3c

    if-ge v1, v2, :cond_0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1282
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ""

    goto :goto_2

    :cond_1
    const-string v3, ","

    :goto_2
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1283
    :cond_2
    invoke-virtual {v0}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "aucun"

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_3
    return-object p0
.end method

.method private freezeForBackground(Ljava/lang/String;)V
    .locals 7

    .line 692
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 693
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 694
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v3

    .line 695
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-nez v5, :cond_0

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 696
    :cond_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    .line 697
    const-string v1, "interrupted"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v0, v5

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 698
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 699
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

    .line 700
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

    .line 699
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 701
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 702
    return-void
.end method

.method private hotfixFlags()Ljava/lang/String;
    .locals 9

    .line 1263
    const-string v0, " "

    const-string v1, "\\s+"

    :try_start_0
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    if-nez v2, :cond_0

    const-string v0, "\u2014"

    return-object v0

    .line 1264
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {v2}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v4, "hotfixes/spotify_bridge.js"

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1265
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    const-string v0, "absent"

    return-object v0

    .line 1266
    :cond_1
    new-instance v2, Ljava/lang/String;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->readAll(Ljava/io/InputStream;)[B

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v2, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1268
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x50

    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1269
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x28

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1270
    const-string v1, "function"

    const/4 v5, -0x1

    invoke-virtual {v2, v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    const-string v6, "window\\."

    invoke-virtual {v2, v6, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    add-int/lit8 v5, v5, -0x1

    .line 1271
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " o ; "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->flagsSetTrue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ; d\u00e9but=["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] ; fin=["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "] ; function="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; window.="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 1272
    :catchall_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "non lisible ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private keepDetail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 491
    const-string v0, ""

    const-string v1, "id"

    const-string v2, "uri"

    :try_start_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 492
    if-eqz v3, :cond_6

    const-string v4, "detail"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    const-wide/16 v6, 0x0

    cmp-long p1, v4, v6

    if-ltz p1, :cond_6

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long/2addr v4, v6

    const-wide/32 v6, 0x1d4c0

    cmp-long p1, v4, v6

    if-lez p1, :cond_0

    goto :goto_2

    .line 493
    :cond_0
    const-string p1, "melodix_playlists"

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v3, 0x0

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 494
    if-nez p1, :cond_1

    return-object p3

    .line 495
    :cond_1
    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p1

    .line 496
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v3, v5, :cond_2

    return-object p3

    .line 497
    :cond_2
    nop

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v4, v3, :cond_5

    .line 498
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 499
    if-eqz v3, :cond_4

    if-eqz v5, :cond_4

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

    if-nez v3, :cond_3

    goto :goto_1

    .line 497
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 499
    :cond_4
    :goto_1
    return-object p3

    .line 501
    :cond_5
    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 492
    :cond_6
    :goto_2
    return-object p3

    .line 502
    :catch_0
    move-exception p1

    return-object p3
.end method

.method private static keepText(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 634
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 635
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

    .line 636
    :cond_0
    return-void
.end method

.method private light(Landroid/view/View;Ljava/lang/String;)V
    .locals 2

    .line 551
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 552
    const v1, 0x7f09023a

    if-eq v0, v1, :cond_4

    const v1, 0x7f090236

    if-eq v0, v1, :cond_4

    const v1, 0x7f09023b

    if-ne v0, v1, :cond_0

    goto :goto_2

    .line 553
    :cond_0
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 554
    check-cast p1, Landroid/widget/TextView;

    .line 555
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p2

    const v0, -0xe128a0

    if-eq p2, v0, :cond_2

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->lit:Ljava/util/List;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->litColors:Ljava/util/List;

    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 556
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 557
    check-cast p1, Landroid/view/ViewGroup;

    .line 558
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/melodix/music/PreviewPlayerController;->light(Landroid/view/View;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 556
    :cond_2
    :goto_1
    nop

    .line 560
    :cond_3
    return-void

    .line 552
    :cond_4
    :goto_2
    return-void
.end method

.method private markBridge()V
    .locals 7

    .line 845
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 846
    if-eqz v0, :cond_1

    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarkAt:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-ltz v3, :cond_0

    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarkAt:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0xfa

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    goto :goto_1

    .line 847
    :cond_0
    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarkAt:J

    .line 848
    :try_start_0
    const-string v1, "(function(w){if(w.__spotiduck_bridge_applied===true&&typeof w.fetchMediaItems===\'function\'&&w.__sfMelodixBridgeCompleted!==true){w.__sfMelodixBridgeCompleted=true;return 1}return 0})(window)"

    new-instance v2, Lcom/melodix/music/PreviewPlayerController$9;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerController$9;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 849
    :goto_0
    return-void

    .line 846
    :cond_1
    :goto_1
    return-void
.end method

.method private now()J
    .locals 2

    .line 610
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private oembed(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 411
    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/melodix/music/PreviewPlayerController$6;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/melodix/music/PreviewPlayerController$6;-><init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 418
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 419
    :goto_0
    return-void
.end method

.method static oembedCover(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 421
    nop

    .line 423
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

    .line 424
    const/16 v1, 0x1388

    :try_start_1
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 425
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_1

    .line 429
    if-eqz p0, :cond_0

    :try_start_2
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 425
    :cond_0
    :goto_0
    return-object v0

    .line 426
    :cond_1
    :try_start_3
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    const/high16 v2, 0x10000

    new-array v3, v2, [B

    const/4 v4, 0x0

    move v5, v4

    .line 427
    :goto_1
    if-ge v5, v2, :cond_2

    sub-int v6, v2, v5

    invoke-virtual {v1, v3, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    if-lez v6, :cond_2

    add-int/2addr v5, v6

    goto :goto_1

    .line 428
    :cond_2
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, v3, v4, v5, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->coverFromOembed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 429
    if-eqz p0, :cond_3

    :try_start_4
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p0

    .line 428
    :cond_3
    :goto_2
    return-object v0

    .line 429
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

    .line 1125
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

    .line 457
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

    .line 458
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

    .line 459
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

    .line 612
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

    .line 615
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_0

    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1

    .line 616
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_1

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    return-wide p1

    .line 617
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 618
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_2

    move-wide v0, p1

    .line 621
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

    .line 622
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    long-to-double p1, p1

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    mul-double/2addr v6, p1

    .line 623
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

    .line 1113
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const-string v0, "lecture interrompue au d\u00e9part ; audio non v\u00e9rifi\u00e9"

    return-object v0

    .line 1114
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const-string v0, "\u00e9tat du lecteur indisponible"

    return-object v0

    .line 1115
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_2

    const-string v0, "pause demand\u00e9e"

    return-object v0

    .line 1116
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    return-object v0

    .line 1117
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "lecture en pause"

    return-object v0

    .line 1118
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_5

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    return-object v0

    .line 1119
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_6

    const-string v0, "position ou dur\u00e9e indisponible"

    return-object v0

    .line 1120
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_7

    const-string v0, "mouvement arr\u00eat\u00e9"

    return-object v0

    .line 1121
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

    .line 1122
    :cond_8
    const-string v0, "animation active"

    return-object v0
.end method

.method static readAll(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1275
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x4000

    new-array v1, v1, [B

    .line 1276
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .line 833
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

    .line 834
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 835
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

    .line 833
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

    .line 797
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_a

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 800
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

    .line 801
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

    .line 802
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

    .line 803
    :cond_4
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    .line 804
    :cond_5
    if-ne v3, v4, :cond_6

    const-string v1, "Mettre en pause"

    goto :goto_2

    :cond_6
    const-string v1, "Lire"

    goto :goto_2

    .line 803
    :cond_7
    :goto_1
    const-string v1, "\u00c9tat de lecture inconnu"

    .line 805
    :goto_2
    const v2, 0x7f090238

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v4, 0x7f09023e

    invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 806
    instance-of v4, v2, Landroid/widget/ImageView;

    if-eqz v4, :cond_8

    move-object v4, v2

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 807
    :cond_8
    instance-of v2, v0, Landroid/widget/ImageView;

    if-eqz v2, :cond_9

    move-object v2, v0

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 808
    :cond_9
    return-void

    .line 797
    :cond_a
    :goto_3
    return-void
.end method

.method private renderProgress()V
    .locals 17

    .line 652
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return-void

    .line 655
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

    .line 656
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

    .line 657
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 658
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

    .line 659
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

    .line 660
    const-string v2, "-:--"

    invoke-direct {v0, v1, v13, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    invoke-direct {v0, v1, v12, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 661
    const/4 v2, 0x0

    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    invoke-direct {v0, v1, v10, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 662
    invoke-virtual {v1, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 663
    if-nez v1, :cond_3

    const/4 v7, 0x0

    goto :goto_0

    :cond_3
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 664
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

    .line 665
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 666
    :cond_4
    return-void

    .line 668
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 669
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    double-to-long v14, v14

    move-object/from16 v16, v8

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v7, v14

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 670
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v9, 0x3e8

    div-long v4, v14, v9

    cmp-long v12, v12, v4

    if-eqz v12, :cond_6

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v14, v15}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 671
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

    .line 672
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

    .line 673
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

    .line 674
    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v3, 0x7f09023d

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 675
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const v3, 0x7f09024a

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const v3, 0x7f09024b

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 676
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 677
    if-nez v1, :cond_9

    const/4 v7, 0x0

    goto :goto_1

    :cond_9
    move-object/from16 v2, v16

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 678
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

    .line 679
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 680
    :cond_a
    return-void
.end method

.method private report()Ljava/lang/String;
    .locals 17

    .line 1139
    move-object/from16 v1, p0

    const-string v2, "non lisible"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1140
    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-gez v0, :cond_0

    const-string v0, "Appui : \u2014\nCommande re\u00e7ue du pont : "

    goto :goto_0

    :cond_0
    const-string v0, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1141
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1142
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1143
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1144
    const-string v0, "\nCache local : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->cacheOutcome:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " ; \u00e9criture : "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->writeStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1145
    const-string v0, "\nCache local : lecture et application \u00e9ventuelle des vues, sans mesure de frame : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    cmp-long v4, v4, v6

    const-string v5, " ms"

    const-string v8, "\u2014"

    if-gez v4, :cond_1

    move-object v4, v8

    goto :goto_1

    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->cacheReadMs:J

    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1146
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1147
    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v4, v9, v6

    if-gez v4, :cond_2

    move-object v4, v8

    goto :goto_2

    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1148
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1149
    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v4, v9, v6

    if-gez v4, :cond_3

    move-object v4, v8

    goto :goto_3

    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_3
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1150
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1151
    iget-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v4, v9, v6

    if-gez v4, :cond_4

    move-object v4, v8

    goto :goto_4

    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_4
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1152
    const-string v0, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1153
    iget-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    cmp-long v4, v9, v6

    if-gez v4, :cond_5

    move-object v4, v8

    goto :goto_5

    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v9, v1, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_5
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1154
    const-string v4, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1155
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1158
    const/4 v4, 0x1

    :try_start_0
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    if-nez v0, :cond_6

    const/4 v9, 0x0

    goto :goto_6

    :cond_6
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v9

    .line 1159
    :goto_6
    const-string v10, "^https://open\\.spotify\\.com/([a-z-]*)"

    invoke-static {v10}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v10

    if-nez v9, :cond_7

    const-string v11, ""

    goto :goto_7

    :cond_7
    move-object v11, v9

    :goto_7
    invoke-virtual {v10, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    .line 1160
    const-string v11, "\nPage Spotify (type de route seulement) : "

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    if-nez v0, :cond_8

    const-string v0, "WebView absente"

    goto :goto_9

    :cond_8
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "chargement "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v0}, Landroid/webkit/WebView;->getProgress()I

    move-result v0

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, " % ; route="

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->find()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-virtual {v10, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_9

    const-string v9, "accueil"

    goto :goto_8

    :cond_9
    invoke-virtual {v10, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_8

    :cond_a
    if-nez v9, :cond_b

    const-string v9, "aucune"

    goto :goto_8

    :cond_b
    const-string v9, "hors Spotify"

    :goto_8
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_9
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1161
    goto :goto_a

    :catch_0
    move-exception v0

    const-string v0, "\nPage Spotify : non lisible"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1164
    :goto_a
    const-string v0, "\nPont (d\u00e9marr\u00e9 ; termin\u00e9 ; mode ; erreur ; CSP ; octets ; \u00e9tape ; requ\u00eate intercept\u00e9e ; octets servis ; service worker actif ; pont entr\u00e9 ; \u00e2ge de la page ; pont d\'origine appliqu\u00e9 ; lecteur de playlist, relev\u00e9 \u00e0 l\'ouverture) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, " ; signaux traduits : "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v9, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeMarks:I

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1166
    :try_start_1
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1167
    if-eqz v0, :cond_c

    const-string v9, "(function(){try{var w=window;var r=[w.__sfMelodixBridgeStarted===true,w.__sfMelodixBridgeCompleted===true,String(w.__sfBridgeExecMode||\'-\'),String(w.__sfBridgeLastError||\'-\'),w.__sfBridgeCspViolation?1:0,w.__sfBridgeBytes|0,String(w.__sfBridgeLoadStage||\'-\').slice(0,40),w.__sfBridgeIntercepted===true,w.__sfBridgeServedBytes|0,!!(navigator.serviceWorker&&navigator.serviceWorker.controller),w.__sfBridgeEntered===true,Math.round(performance.now()/1000)+\' s\',w.__spotiduck_bridge_applied===true,typeof w.fetchMediaItems].join(\' ; \');return r}catch(e){return \'erreur\'}})()"

    new-instance v10, Lcom/melodix/music/PreviewPlayerController$13;

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController$13;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v9, v10}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1169
    :cond_c
    goto :goto_b

    :catch_1
    move-exception v0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    .line 1172
    :goto_b
    const-string v0, "\nPont t\u00e9l\u00e9charg\u00e9 (taille ; drapeaux pos\u00e9s \u00e0 true) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->hotfixFlags()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1173
    const-string v0, "\nDrapeaux __sf vrais dans la page (relev\u00e9 \u00e0 l\'ouverture) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1175
    const-string v0, "\nChamps d\'une ligne de titre (noms seulement) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->rowKeys:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1176
    const-string v0, "\nFonctions du pont utiles au menu (noms seulement) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1178
    :try_start_2
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1179
    if-eqz v0, :cond_d

    const-string v9, "(function(){try{return Object.keys(window).filter(function(k){return typeof window[k]===\'function\'&&/queue|album|artist|share|playlist|context|menu|add|remove/i.test(k)}).sort().join(\',\').slice(0,900)}catch(e){return \'erreur\'}})()"

    new-instance v10, Lcom/melodix/music/PreviewPlayerController$14;

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController$14;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v9, v10}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1181
    :cond_d
    goto :goto_c

    :catch_2
    move-exception v0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    .line 1183
    :goto_c
    :try_start_3
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1184
    if-eqz v0, :cond_e

    const-string v9, "(function(){try{return Object.keys(window).filter(function(k){return /^__sf/.test(k)&&window[k]===true}).sort().join(\',\').slice(0,900)}catch(e){return \'erreur\'}})()"

    new-instance v10, Lcom/melodix/music/PreviewPlayerController$15;

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController$15;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v9, v10}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 1186
    :cond_e
    goto :goto_d

    :catch_3
    move-exception v0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    .line 1187
    :goto_d
    const-string v0, "\nSource position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1188
    const-string v0, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    const-string v9, "oui"

    const-string v10, "non"

    if-eqz v2, :cond_f

    move-object v2, v9

    goto :goto_e

    :cond_f
    move-object v2, v10

    :goto_e
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1189
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1190
    const-string v0, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_10

    goto :goto_f

    :cond_10
    move-object v9, v10

    :goto_f
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1191
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1192
    const-string v0, " ; \u00e2ge de la mesure : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v2, v11, v6

    if-gez v2, :cond_11

    move-object v2, v8

    goto :goto_10

    :cond_11
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v11

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long/2addr v11, v13

    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1193
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1194
    const-string v0, " ; appui \u2192 navigation : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1195
    const-string v0, " ; titres affich\u00e9s : premi\u00e8re liste="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez v2, :cond_12

    move-object v2, v8

    goto :goto_11

    :cond_12
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    :goto_11
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", derni\u00e8re="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    if-gez v2, :cond_13

    move-object v2, v8

    goto :goto_12

    :cond_13
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    :goto_12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1196
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1197
    const-string v0, " ; page pr\u00eate/pont \u2192 lignes re\u00e7ues : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v2, v11, v6

    if-ltz v2, :cond_14

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    goto :goto_13

    :cond_14
    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    :goto_13
    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1198
    const-string v0, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1199
    const-string v0, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1200
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v0, :cond_16

    const-string v0, "\nLik\u00e9s : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1201
    const-string v2, " ; rendu natif : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v2, v11, v6

    if-gez v2, :cond_15

    const-string v2, "non observ\u00e9"

    goto :goto_14

    :cond_15
    const-string v2, "lignes visibles"

    :goto_14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1202
    :cond_16
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1203
    const-string v0, " ; waiting-bridge avec lignes : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v2, v11, v6

    if-gez v2, :cond_17

    const-string v10, "ind\u00e9termin\u00e9"

    goto :goto_15

    :cond_17
    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v9, "waiting-bridge"

    invoke-virtual {v2, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_18

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->staleWaitingObserved:Z

    if-eqz v2, :cond_19

    :cond_18
    const-string v10, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    :cond_19
    :goto_15
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1204
    const-string v0, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1205
    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v0, :cond_1a

    const-string v0, " aucun"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1206
    :cond_1a
    const/4 v0, 0x0

    move v2, v0

    :goto_16
    iget v9, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-ge v2, v9, :cond_1c

    .line 1207
    iget v9, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    iget v10, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    sub-int/2addr v9, v10

    add-int/2addr v9, v4

    add-int/2addr v9, v2

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v10, v10

    add-int/2addr v9, v10

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagSeq:[J

    array-length v10, v10

    rem-int/2addr v9, v10

    .line 1208
    const-string v10, "\n#"

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    .line 1209
    invoke-direct {v1, v12, v13, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1210
    const-string v10, " ; fin JS : "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v12, v11, v9

    iget-object v11, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCallback:[J

    aget-wide v14, v11, v9

    invoke-direct {v1, v12, v13, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 1211
    const-string v11, " ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v12, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v12, v12, v9

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, ")"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1212
    const-string v10, " ; premi\u00e8re position UI diff\u00e9rente : "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v13, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v14, v13, v9

    iget-object v13, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    move-object/from16 v16, v5

    aget-wide v4, v13, v9

    invoke-direct {v1, v14, v15, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1213
    const-string v4, " ; position UI confirm\u00e9e : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagRelease:[J

    aget-wide v13, v5, v9

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    aget-wide v6, v5, v9

    invoke-direct {v1, v13, v14, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1214
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v5, v5, v9

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1215
    const-string v4, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1216
    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v6, v5, v9

    const-wide/16 v10, 0x0

    cmp-long v5, v6, v10

    if-gez v5, :cond_1b

    move-object v5, v8

    move-object/from16 v6, v16

    goto :goto_17

    :cond_1b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagAge:[J

    aget-wide v9, v6, v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v6, v16

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_17
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1206
    add-int/lit8 v2, v2, 0x1

    move-object v5, v6

    const/4 v4, 0x1

    const-wide/16 v6, 0x0

    goto/16 :goto_16

    .line 1218
    :cond_1c
    move-object v6, v5

    const-string v2, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1219
    const-string v2, "\nIntervalles position : "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1220
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v2, :cond_1d

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1221
    :cond_1d
    move v2, v0

    :goto_18
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-ge v2, v4, :cond_1f

    .line 1222
    if-lez v2, :cond_1e

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1223
    :cond_1e
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget v5, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    sub-int/2addr v4, v5

    add-int/2addr v4, v2

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    add-int/2addr v4, v5

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    rem-int/2addr v4, v5

    .line 1224
    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v4, v5, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1221
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 1226
    :cond_1f
    const-string v2, "\nRetour \u2014 absence : "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    const-wide/16 v7, 0x0

    cmp-long v4, v4, v7

    if-gez v4, :cond_20

    const-string v4, "inconnue"

    goto :goto_19

    :cond_20
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v7, v1, Lcom/melodix/music/PreviewPlayerController;->absenceDuration:J

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_19
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1227
    const-string v2, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1228
    const-string v2, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1229
    move v2, v0

    :goto_1a
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    const-string v5, "\n"

    if-ge v2, v4, :cond_21

    .line 1230
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventIndex:I

    iget v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    sub-int/2addr v4, v6

    add-int/2addr v4, v2

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v6, v6

    add-int/2addr v4, v6

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    array-length v6, v6

    rem-int/2addr v4, v6

    .line 1231
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v4, v6, v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1229
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 1233
    :cond_21
    const-string v2, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1234
    move v2, v0

    :goto_1b
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    if-ge v2, v4, :cond_22

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnSeconds:[Ljava/lang/String;

    aget-object v6, v6, v2

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 1235
    :cond_22
    const-string v2, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1236
    nop

    :goto_1c
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-ge v0, v2, :cond_23

    .line 1237
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    sub-int/2addr v2, v4

    add-int/2addr v2, v0

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v4, v4

    add-int/2addr v2, v4

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v4, v4

    rem-int/2addr v2, v4

    .line 1238
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v2, v6, v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1236
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .line 1240
    :cond_23
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1241
    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1242
    invoke-static {}, Lcom/melodix/music/PreviewPlayerVolume;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1243
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1244
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private resetDivergence()V
    .locals 2

    .line 703
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

    .line 385
    const-string v0, "preview_cover"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 386
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

    .line 387
    :cond_0
    const p2, 0x7f090244

    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f090245

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 388
    instance-of v0, p2, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    check-cast p2, Landroid/widget/ImageView;

    const/16 v0, 0xc0

    invoke-static {p2, v1, v0}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 389
    :cond_1
    instance-of p2, p1, Landroid/widget/ImageView;

    if-eqz p2, :cond_2

    check-cast p1, Landroid/widget/ImageView;

    const/16 p2, 0x2d0

    invoke-static {p1, v1, p2}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 390
    :cond_2
    return-void

    .line 386
    :cond_3
    :goto_0
    return-void
.end method

.method static sameArtists(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 646
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 647
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 648
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

    .line 649
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

    .line 648
    :goto_0
    return v1
.end method

.method private saveInProcess()V
    .locals 2

    .line 604
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 605
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    .line 606
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 607
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 608
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

    .line 609
    return-void
.end method

.method private saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 10

    .line 349
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

    .line 353
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

    .line 355
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

    .line 356
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

    .line 357
    :cond_3
    const-string v0, "previewObservedAtMs"

    const-wide/16 v12, -0x1

    invoke-virtual {v2, v0, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    .line 358
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

    .line 359
    new-instance v10, Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-direct {v10}, Lcom/melodix/music/PreviewLastTrackStore$Record;-><init>()V

    .line 360
    iput-object v3, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    iput-object v4, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    iput-object v5, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    move-wide/from16 v3, p5

    iput-wide v3, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    iput-wide v6, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    iput-wide v12, v10, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    .line 361
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v10, v3, v4}, Lcom/melodix/music/PreviewLastTrackStore;->valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z

    move-result v3

    if-nez v3, :cond_4

    return-void

    .line 362
    :cond_4
    const v3, 0x7f090244

    invoke-virtual {v8, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 364
    if-nez p9, :cond_5

    invoke-virtual {v2, v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    instance-of v2, v3, Landroid/widget/ImageView;

    if-eqz v2, :cond_5

    .line 365
    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 366
    instance-of v3, v2, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v3, :cond_5

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_2

    .line 368
    :cond_5
    const/4 v2, 0x0

    :goto_2
    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 369
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

    .line 370
    :cond_6
    return-void

    .line 371
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

    .line 372
    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedIdentity:Ljava/lang/String;

    iput-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->lastCachedState:Ljava/lang/String;

    iput-wide v14, v1, Lcom/melodix/music/PreviewPlayerController;->lastCacheWrite:J

    .line 373
    invoke-static {v8, v10, v2}, Lcom/melodix/music/PreviewLastTrackStore;->save(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V

    .line 374
    return-void

    .line 356
    :cond_a
    :goto_5
    return-void
.end method

.method private scheduleFrame()V
    .locals 2

    .line 814
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

    .line 815
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 3

    .line 724
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 725
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

    .line 630
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 631
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

    .line 632
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 1

    .line 682
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 683
    instance-of p2, p1, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_1

    .line 684
    check-cast p1, Landroid/widget/ProgressBar;

    .line 685
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    move-result p2

    const/16 v0, 0x3e8

    if-eq p2, v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 686
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p2

    if-eq p2, p3, :cond_1

    invoke-virtual {p1, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 688
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

    .line 514
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 515
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

    .line 516
    :cond_1
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0
.end method

.method private showDiagnosticsNow()V
    .locals 4

    .line 1286
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1287
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 1288
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$17;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$17;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    .line 1289
    const-string v0, "Copier"

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1294
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1295
    return-void

    .line 1286
    :cond_1
    :goto_0
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .line 750
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v0, p1

    .line 751
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

    .line 752
    :cond_1
    return-void
.end method

.method static storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 6

    .line 473
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 474
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 475
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 476
    :cond_0
    const-string v3, "id"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "uri"

    invoke-virtual {v2, v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 477
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

    .line 478
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

    .line 474
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 480
    :cond_3
    return-object v0
.end method

.method private storeRows(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 11

    .line 519
    const-string v0, "#t"

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 520
    if-eqz v1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_4

    .line 521
    :cond_0
    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_1

    return-void

    .line 523
    :cond_1
    :try_start_0
    const-string v2, "melodix_playlists"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 524
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {p2, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 525
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 526
    invoke-interface {v1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

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

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 527
    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    const/16 v4, 0x1e

    if-lt p1, v4, :cond_6

    .line 528
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 529
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

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

    invoke-interface {v1, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    cmp-long v6, v9, v6

    if-gez v6, :cond_4

    move-object p1, v5

    goto :goto_2

    .line 530
    :cond_5
    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-interface {p2, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v4, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 531
    goto :goto_1

    .line 532
    :cond_6
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 533
    :catch_0
    move-exception p1

    :goto_3
    nop

    .line 534
    return-void

    .line 520
    :cond_7
    :goto_4
    return-void
.end method

.method private syncGlow()V
    .locals 8

    .line 754
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 755
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

    .line 756
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v5

    .line 757
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

    .line 758
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

    .line 759
    :goto_2
    const v1, 0x7f09024d

    const v2, 0x7f09023d

    filled-new-array {v1, v2}, [I

    move-result-object v1

    .line 760
    nop

    :goto_3
    const/4 v2, 0x2

    if-ge v3, v2, :cond_7

    .line 761
    const/4 v5, 0x0

    if-nez v0, :cond_3

    move-object v6, v5

    goto :goto_4

    :cond_3
    aget v6, v1, v3

    invoke-virtual {v0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 762
    :goto_4
    nop

    .line 763
    if-eqz v4, :cond_4

    instance-of v7, v6, Landroid/widget/ProgressBar;

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 764
    check-cast v6, Landroid/widget/ProgressBar;

    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 765
    instance-of v7, v6, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v7, :cond_4

    .line 766
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 767
    check-cast v6, Landroid/graphics/drawable/LayerDrawable;

    const v5, 0x102000d

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 770
    :cond_4
    if-nez v5, :cond_5

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    goto :goto_5

    .line 771
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

    .line 772
    :cond_6
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 773
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v5, v6, v3

    .line 774
    const/16 v6, 0x96

    const/16 v7, 0xff

    filled-new-array {v6, v7}, [I

    move-result-object v6

    const-string v7, "alpha"

    invoke-static {v5, v7, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 775
    const-wide/16 v6, 0x640

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 776
    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 777
    const/4 v2, -0x1

    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 778
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v5, v2, v3

    .line 779
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 760
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 781
    :cond_7
    return-void
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 638
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 639
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 640
    :cond_0
    return-void
.end method


# virtual methods
.method public acceptPlayerPayload(Ljava/lang/String;)Z
    .locals 18

    .line 322
    move-object/from16 v1, p0

    const-string v0, ""

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    const/4 v3, 0x1

    if-nez v2, :cond_0

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-nez v2, :cond_0

    return v3

    .line 323
    :cond_0
    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    const/4 v4, 0x0

    if-nez v2, :cond_1

    return v4

    .line 325
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    move-object/from16 v5, p1

    invoke-direct {v2, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 326
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

    .line 327
    const-string v7, "previewPositionMs"

    const-wide/16 v8, -0x1

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-string v7, "previewDurationMs"

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 328
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-string v7, "previewObservedAtMs"

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v16

    sub-long v14, v14, v16

    .line 329
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

    .line 331
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "paused"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_3

    .line 334
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

    .line 335
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

    .line 336
    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveKey:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveAt:J

    return v4

    .line 337
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    iget-wide v10, v1, Lcom/melodix/music/PreviewPlayerController;->pendingLiveAt:J

    sub-long/2addr v5, v10

    const-wide/16 v10, 0x5dc

    cmp-long v0, v5, v10

    if-gez v0, :cond_5

    return v4

    .line 339
    :cond_5
    iput-boolean v3, v1, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 340
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    if-eqz v0, :cond_8

    .line 341
    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v4, v1, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-wide v8, v1, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 342
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

    .line 343
    :goto_0
    if-nez v0, :cond_7

    :goto_1
    goto :goto_2

    :cond_7
    const-string v2, "previewPlayerDragHandle"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    goto :goto_1

    .line 344
    :goto_2
    instance-of v0, v2, Landroid/widget/TextView;

    if-eqz v0, :cond_8

    check-cast v2, Landroid/widget/TextView;

    const-string v0, "LECTURE EN COURS"

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 346
    :cond_8
    return v3

    .line 331
    :cond_9
    :goto_3
    return v4

    .line 347
    :catch_0
    move-exception v0

    return v4
.end method

.method public activityCreated()V
    .locals 4

    .line 218
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->crashCatcher(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 219
    :cond_0
    :goto_0
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    return-void

    .line 220
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 223
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_3

    .line 225
    :try_start_1
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 226
    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J
    :try_end_1
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 227
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    :cond_2
    :goto_1
    nop

    .line 229
    :cond_3
    return-void
.end method

.method public activityPaused()V
    .locals 1

    .line 690
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 13

    .line 705
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 706
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

    .line 707
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v2, 0x0

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 708
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

    .line 710
    :goto_1
    const/4 v9, 0x0

    if-eqz v3, :cond_2

    sget-object v10, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    if-eqz v10, :cond_2

    sget-object v10, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    sput-object v9, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-virtual {p0, v10}, Lcom/melodix/music/PreviewPlayerController;->snapshot(Ljava/lang/String;)V

    .line 712
    :cond_2
    iget-boolean v10, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v10, :cond_3

    sget-boolean v10, Lcom/melodix/music/PreviewPlayerController;->bgPlaying:Z

    if-eqz v10, :cond_3

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_3

    .line 713
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 714
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

    .line 715
    const-string v2, "playing"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 716
    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 717
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

    .line 719
    :cond_3
    sput-wide v6, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sput-object v9, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 720
    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 721
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

    .line 722
    return-void
.end method

.method public activityStarted()V
    .locals 1

    .line 689
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 1

    .line 745
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    const-string v0, "onStop (sans onPause observ\u00e9)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    .line 746
    :cond_0
    const-string v0, "onStop ; position fig\u00e9e ; signal audio natif=non lu (incertain)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 747
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 748
    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .line 1107
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$12;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$12;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1110
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

    .line 1087
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 1088
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 1091
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    :cond_0
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz p1, :cond_1

    .line 1092
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

    .line 1093
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    const p1, 0x3ee66666    # 0.45f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 1094
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1096
    :cond_1
    return-void
.end method

.method public clearLastTrack()V
    .locals 3

    .line 438
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

    .line 439
    :cond_0
    const-string v0, "forgetHome"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->callStyler(Ljava/lang/String;)V

    .line 440
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->restored:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->liveObserved:Z

    .line 441
    sput-boolean v1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    sput-boolean v1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 442
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 443
    return-void
.end method

.method public command()V
    .locals 4

    .line 1105
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

    .line 817
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 818
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    .line 819
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 820
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    const-wide/16 v2, 0x0

    if-eqz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    .line 821
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 822
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v0

    if-gtz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v4, v0, v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 824
    :cond_1
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz p2, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_2

    .line 825
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 827
    :cond_2
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 828
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_3

    return-void

    .line 829
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 830
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

    .line 831
    :cond_6
    return-void
.end method

.method fetchCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 395
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 396
    :cond_0
    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 397
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

    .line 398
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

    .line 399
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

    .line 401
    :cond_3
    iget-object p3, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {p3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/webkit/WebView;

    if-nez p3, :cond_4

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    return-void

    .line 403
    :cond_4
    :try_start_0
    const-string v0, "(function(){try{var a=document.querySelector(\'[data-testid=\"now-playing-widget\"] a[href*=\"/album/\"],[data-testid=\"now-playing-widget-v2\"] a[href*=\"/album/\"],[data-testid=\"now-playing-bar\"] a[href*=\"/album/\"]\');var m=a&&String(a.getAttribute(\'href\')).match(/\\/album\\/([A-Za-z0-9]{22})/);return m?m[1]:\'\'}catch(e){return \'\'}})()"

    new-instance v2, Lcom/melodix/music/PreviewPlayerController$5;

    invoke-direct {v2, p0, p2, p1}, Lcom/melodix/music/PreviewPlayerController$5;-><init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {p3, v0, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 408
    goto :goto_0

    :catchall_0
    move-exception p1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->coverAsked:Ljava/lang/String;

    .line 409
    :goto_0
    return-void
.end method

.method highlightPlaying(Z)V
    .locals 4

    .line 542
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->onDetail:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 543
    :goto_0
    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->litTitle:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    .line 544
    :cond_1
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->litTitle:Ljava/lang/String;

    .line 545
    const/4 p1, 0x0

    :goto_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->lit:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_3

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->lit:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v2

    const v3, -0xe128a0

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->litColors:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 546
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->lit:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->litColors:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 547
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    if-eqz p1, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_2

    .line 548
    :cond_4
    const v1, 0x7f09022f

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-direct {p0, p1, v0}, Lcom/melodix/music/PreviewPlayerController;->light(Landroid/view/View;Ljava/lang/String;)V

    .line 549
    :cond_5
    return-void

    .line 547
    :cond_6
    :goto_2
    return-void
.end method

.method keepHome(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 509
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->homeAt:J

    .line 510
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

    .line 511
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->homeRows:Ljava/lang/String;

    return-object p1
.end method

.method public keepRows(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 486
    const-string v0, "home"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p3}, Lcom/melodix/music/PreviewPlayerController;->keepHome(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 487
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->keepDetail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public layoutReady()V
    .locals 3

    .line 243
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 244
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheLoading:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->cacheStart:J

    .line 246
    new-instance v1, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewLastTrackStore;->load(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Callback;)V

    .line 282
    const-string v0, "restoreHome"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->callStyler(Ljava/lang/String;)V

    .line 283
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

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

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

    .line 445
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->previousPlaylistFrameMs:J

    .line 446
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

    .line 447
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

    .line 449
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 450
    const-string v0, "spotify:collection:tracks"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    .line 451
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 452
    :cond_1
    return-void
.end method

.method rememberCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 379
    const-string v0, "https://"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 380
    :cond_0
    const-string v0, "preview_cover"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 381
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

    .line 382
    :cond_2
    return-void
.end method

.method restoreCover(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 383
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
    .locals 10

    .line 562
    const-string v0, "detail"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "uri"

    const-string v3, ""

    const/4 v4, 0x0

    if-eqz v1, :cond_4

    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move v5, v4

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_3

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 563
    if-eqz v6, :cond_2

    invoke-virtual {v6, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "spotify:track:"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 564
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-nez v6, :cond_0

    move-object v6, v3

    goto :goto_2

    :cond_0
    const-string v6, ","

    :goto_2
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->rowKeys:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 562
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 564
    :catch_0
    move-exception v1

    :cond_3
    :goto_3
    nop

    .line 565
    :cond_4
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->onDetail:Z

    const/4 v1, 0x1

    :try_start_1
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerController;->highlightPlaying(Z)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v5

    .line 568
    :goto_4
    nop

    .line 569
    :try_start_2
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-nez v5, :cond_6

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/Activity;

    const/4 v6, 0x0

    if-nez v5, :cond_5

    :goto_5
    goto :goto_6

    :cond_5
    const-string v7, "melodix_playlists"

    invoke-virtual {v5, v7, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_5

    :goto_6
    if-eqz v6, :cond_6

    goto :goto_7

    :cond_6
    move-object v6, p3

    goto :goto_7

    :catch_2
    move-exception v5

    move-object v6, p3

    .line 570
    :goto_7
    nop

    .line 571
    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerController;->onDetail:Z

    if-eqz v5, :cond_7

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v7, Lcom/melodix/music/PreviewPlayerController$7;

    invoke-direct {v7, p0, v6}, Lcom/melodix/music/PreviewPlayerController$7;-><init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    invoke-virtual {v5, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 572
    :cond_7
    const-string v5, "home"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-wide/16 v6, 0x0

    if-eqz v5, :cond_8

    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v5, v8, v6

    if-ltz v5, :cond_8

    sget-wide v8, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v5, v8, v6

    if-gez v5, :cond_8

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 573
    :cond_8
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    if-eqz p2, :cond_9

    :try_start_3
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p2, v5}, Lcom/melodix/music/PreviewPlayerController;->storeRows(Ljava/lang/String;Lorg/json/JSONArray;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_8

    :catch_3
    move-exception v5

    .line 574
    :cond_9
    :goto_8
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p1, v8, v6

    if-ltz p1, :cond_e

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    .line 576
    :try_start_4
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 577
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-lez p2, :cond_a

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    iget p3, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez p3, :cond_a

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    .line 578
    :cond_a
    nop

    :goto_9
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-ge v4, p2, :cond_d

    .line 579
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p2

    .line 580
    if-eqz p2, :cond_c

    const-string p3, "id"

    invoke-virtual {p2, p3, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, v2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "(?i)^spotify:track:[a-z0-9]+$"

    invoke-virtual {p2, p3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_c

    .line 581
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long p1, p1, v6

    if-gez p1, :cond_b

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 582
    :cond_b
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 583
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_a

    .line 578
    :cond_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 586
    :catch_4
    move-exception p1

    :cond_d
    :goto_a
    nop

    .line 588
    :cond_e
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 589
    return-void
.end method

.method public run()V
    .locals 12

    .line 727
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 728
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 729
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 730
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 731
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

    .line 732
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

    .line 733
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

    .line 734
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v6

    .line 735
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

    .line 736
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 737
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

    .line 738
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

    .line 740
    :cond_5
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 741
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_6

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 742
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 743
    return-void

    .line 728
    :cond_7
    :goto_3
    return-void
.end method

.method public showDiagnostics()V
    .locals 5

    .line 1249
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 1252
    :cond_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeSeq:I

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    .line 1253
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    const-wide/16 v3, 0x1388

    add-long/2addr v1, v3

    .line 1254
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$16;

    invoke-direct {v4, p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController$16;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    const-wide/16 v0, 0x96

    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1258
    return-void
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 51

    .line 851
    move-object/from16 v11, p0

    move-object/from16 v0, p1

    const-string v1, "range"

    const-string v2, "none"

    const-string v3, "previewPlaybackState"

    const-string v4, "previewProgressValid"

    const-string v5, "playing"

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->markBridge()V

    .line 853
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 854
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v8

    .line 855
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7

    const-string v10, "artist"

    const-string v15, "track"

    const-string v12, ""

    move-object/from16 v16, v15

    const-wide/16 v14, -0x1

    if-nez v7, :cond_4

    .line 856
    :try_start_1
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    const-string v0, "callback legacy ignor\u00e9 en arri\u00e8re-plan"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void

    .line 860
    :cond_0
    move-object/from16 v7, v16

    invoke-virtual {v6, v7, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 863
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

    .line 864
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 865
    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    iput-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    goto :goto_0

    .line 866
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

    .line 867
    :cond_3
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 868
    return-void

    .line 870
    :cond_4
    move-object/from16 v7, v16

    invoke-virtual {v6, v7, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 871
    const-string v13, "previewTrackUri"

    invoke-virtual {v6, v13, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 872
    const-string v14, "previewPositionMs"

    move-object/from16 v20, v12

    move-object/from16 v19, v13

    const-wide/16 v12, -0x1

    invoke-virtual {v6, v14, v12, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v14

    const-string v12, "previewDurationMs"

    move-object/from16 v21, v1

    move-object/from16 v22, v2

    const-wide/16 v1, -0x1

    invoke-virtual {v6, v12, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 873
    const/4 v1, 0x0

    invoke-virtual {v6, v5, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7

    move-wide/from16 v23, v14

    move-wide v13, v12

    move-object/from16 v12, v19

    const-string v15, "paused"

    if-eqz v2, :cond_5

    move-object v2, v5

    goto :goto_1

    :cond_5
    move-object v2, v15

    :goto_1
    :try_start_2
    invoke-virtual {v6, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 874
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    const-string v1, "unknown"

    if-nez v16, :cond_6

    :try_start_3
    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_6

    move-object v2, v1

    .line 876
    :cond_6
    invoke-virtual {v6, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 877
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_7

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_7

    move-object v15, v1

    goto :goto_2

    .line 878
    :cond_7
    move-object v15, v3

    :goto_2
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 879
    const/4 v3, 0x0

    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    move-object/from16 v19, v2

    const-wide/16 v2, 0x0

    if-eqz v4, :cond_8

    cmp-long v4, v13, v2

    if-lez v4, :cond_8

    cmp-long v4, v23, v2

    if-ltz v4, :cond_8

    cmp-long v4, v23, v13

    if-gtz v4, :cond_8

    const/4 v4, 0x1

    goto :goto_3

    :cond_8
    const/4 v4, 0x0

    .line 880
    :goto_3
    invoke-static {v7}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_9

    invoke-static {v10}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_9

    cmp-long v25, v13, v2

    if-lez v25, :cond_9

    const/16 v25, 0x1

    goto :goto_4

    :cond_9
    const/16 v25, 0x0

    .line 882
    :goto_4
    if-eqz v25, :cond_b

    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_a

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 883
    invoke-static {v2, v10}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-wide v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v2, v2, v13

    if-eqz v2, :cond_b

    :cond_a
    const/4 v2, 0x1

    goto :goto_5

    :cond_b
    const/4 v2, 0x0

    .line 884
    :goto_5
    move-object/from16 v28, v12

    move-wide/from16 v29, v13

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    cmp-long v3, v12, v8

    if-lez v3, :cond_d

    .line 886
    if-eqz v2, :cond_c

    const-wide/16 v12, -0x1

    iput-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    iget-object v3, v11, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {v3, v12}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v11, v3}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    goto :goto_6

    .line 887
    :cond_c
    if-eqz v25, :cond_d

    return-void

    .line 889
    :cond_d
    :goto_6
    invoke-direct {v11, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v12

    .line 890
    if-nez v2, :cond_e

    if-eqz v4, :cond_e

    move-wide/from16 v31, v12

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v26, 0x0

    cmp-long v3, v12, v26

    if-ltz v3, :cond_f

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v33, 0x7d0

    sub-long v12, v12, v33

    cmp-long v3, v23, v12

    if-gez v3, :cond_f

    const/4 v13, 0x1

    goto :goto_7

    :cond_e
    move-wide/from16 v31, v12

    :cond_f
    const/4 v13, 0x0

    .line 891
    :goto_7
    if-eqz v4, :cond_10

    if-nez v2, :cond_10

    if-nez v13, :cond_10

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v26, 0x0

    cmp-long v3, v12, v26

    if-ltz v3, :cond_10

    iget-wide v12, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v3, v23, v12

    if-eqz v3, :cond_10

    .line 892
    :cond_10
    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v3, :cond_11

    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v3, :cond_11

    if-eqz v5, :cond_11

    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v3, :cond_11

    if-nez v2, :cond_11

    const/4 v13, 0x1

    goto :goto_8

    :cond_11
    const/4 v13, 0x0

    .line 893
    :goto_8
    iget-boolean v3, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 894
    const-string v12, "previewProgressSource"

    move-object/from16 v14, v22

    invoke-virtual {v6, v12, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 895
    iget-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v22, v3

    move-object/from16 v3, v21

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_12

    iget-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v21, v13

    const-string v13, "media"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_13

    iget-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v13, "clock"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_13

    iput-object v14, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    goto :goto_9

    :cond_12
    move/from16 v21, v13

    .line 898
    :cond_13
    :goto_9
    const-string v12, "previewObservedAtMs"

    const-wide/16 v13, -0x1

    invoke-virtual {v6, v12, v13, v14}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v33

    .line 899
    const-wide/16 v12, 0x0

    cmp-long v14, v33, v12

    if-gez v14, :cond_14

    const-wide/16 v12, -0x1

    goto :goto_a

    :cond_14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v12, v12, v33

    .line 900
    :goto_a
    iget-boolean v14, v11, Lcom/melodix/music/PreviewPlayerController;->foreground:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7

    move-object/from16 v33, v15

    const-string v15, " ms ; \u00e2ge observation="

    const-string v11, "mesure="

    const-string v34, "inconnu"

    move-object/from16 v35, v15

    const-string v15, " ms"

    const-wide/16 v36, 0xbb8

    if-nez v14, :cond_18

    .line 904
    if-eqz v4, :cond_16

    if-eqz v25, :cond_16

    const-wide/16 v2, 0x0

    cmp-long v1, v12, v2

    if-ltz v1, :cond_15

    cmp-long v1, v12, v36

    if-gez v1, :cond_15

    .line 905
    :try_start_4
    sput-wide v23, Lcom/melodix/music/PreviewPlayerController;->bgPos:J

    sput-wide v8, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sput-boolean v5, Lcom/melodix/music/PreviewPlayerController;->bgPlaying:Z

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 906
    const/4 v0, 0x1

    move-object/from16 v1, p0

    move-wide v8, v2

    move-object/from16 v14, v19

    move-object v2, v6

    move-object v3, v7

    move-object v4, v10

    move-object v5, v14

    move-wide/from16 v6, v23

    move-object/from16 v19, v15

    move-wide v14, v8

    move-wide/from16 v8, v29

    move v10, v0

    invoke-direct/range {v1 .. v10}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJZ)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_c

    .line 1052
    :catch_0
    move-exception v0

    move-object/from16 v11, p0

    goto/16 :goto_3e

    .line 904
    :cond_15
    move-object/from16 v19, v15

    move-wide v14, v2

    goto :goto_b

    :cond_16
    move-object/from16 v19, v15

    const-wide/16 v14, 0x0

    .line 907
    :goto_b
    const-wide/16 v1, -0x1

    :try_start_5
    sput-wide v1, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    const/4 v0, 0x0

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 908
    :goto_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v11, v35

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    cmp-long v1, v12, v14

    if-gez v1, :cond_17

    :goto_d
    move-object/from16 v1, v34

    goto :goto_e

    :cond_17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v2, v19

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    goto :goto_d

    :goto_e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-object/from16 v1, p0

    :try_start_6
    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ; \u00e9tat page="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v2, v33

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ; rejet\u00e9e : arri\u00e8re-plan ; signal audio natif=non lu"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 910
    return-void

    .line 1052
    :catch_1
    move-exception v0

    goto :goto_f

    :catch_2
    move-exception v0

    move-object/from16 v1, p0

    :goto_f
    move-object v11, v1

    goto/16 :goto_3e

    .line 912
    :cond_18
    move-object/from16 v14, p0

    move-object/from16 p1, v6

    move-object v0, v15

    move-object/from16 v15, v19

    move-object/from16 v19, v7

    move-wide/from16 v6, v23

    move-object/from16 v23, v10

    move-object v10, v11

    move-object/from16 v11, v35

    :try_start_7
    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v24

    const-wide/high16 v38, 0x7ff8000000000000L    # Double.NaN

    if-eqz v24, :cond_19

    move-object/from16 v24, v10

    move-object/from16 v35, v11

    move-wide/from16 v10, v38

    goto :goto_10

    :cond_19
    move-object/from16 v24, v10

    move-object/from16 v35, v11

    long-to-double v10, v6

    sub-double v10, v10, v31

    .line 913
    :goto_10
    move-object/from16 v40, v0

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_1a

    move-wide/from16 v41, v10

    iget-wide v10, v14, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const-wide/16 v26, 0x0

    cmp-long v0, v10, v26

    if-ltz v0, :cond_1b

    iget-wide v10, v14, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v10, v8, v10

    const-wide/16 v43, 0x3e8

    cmp-long v0, v10, v43

    if-ltz v0, :cond_1b

    if-eqz v4, :cond_1b

    const-wide/16 v10, 0x0

    cmp-long v0, v12, v10

    if-ltz v0, :cond_1b

    cmp-long v0, v12, v36

    if-gez v0, :cond_1b

    if-eqz v25, :cond_1b

    .line 914
    invoke-virtual {v15, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v10, 0x1

    goto :goto_11

    .line 913
    :cond_1a
    move-wide/from16 v41, v10

    .line 914
    :cond_1b
    const/4 v10, 0x0

    .line 918
    :goto_11
    if-eqz v4, :cond_1d

    const-wide/16 v26, 0x0

    cmp-long v0, v12, v26

    if-ltz v0, :cond_1d

    cmp-long v0, v12, v36

    if-gez v0, :cond_1d

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_1d

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_1d

    if-eqz v25, :cond_1d

    if-nez v2, :cond_1d

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_1d

    if-eqz v5, :cond_1d

    const-wide/16 v43, 0x2710

    cmp-long v0, v29, v43

    if-ltz v0, :cond_1d

    .line 920
    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1c

    move-object v11, v1

    sub-long v0, v29, v36

    long-to-double v0, v0

    cmpl-double v0, v31, v0

    if-ltz v0, :cond_1e

    cmp-long v0, v6, v36

    if-gtz v0, :cond_1e

    const/4 v1, 0x1

    goto :goto_13

    :cond_1c
    move-object v11, v1

    goto :goto_12

    .line 918
    :cond_1d
    move-object v11, v1

    .line 920
    :cond_1e
    :goto_12
    const/4 v1, 0x0

    .line 921
    :goto_13
    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v43, 0x1388

    if-eqz v0, :cond_1f

    const-wide/16 v45, 0x1f40

    move-wide/from16 v49, v8

    move-wide/from16 v8, v45

    move-wide/from16 v45, v49

    goto :goto_14

    :cond_1f
    move-wide/from16 v45, v8

    move-wide/from16 v8, v43

    .line 922
    :goto_14
    if-nez v4, :cond_20

    const-string v0, "invalide"

    :goto_15
    move-object v3, v0

    goto :goto_16

    :cond_20
    const-wide/16 v3, 0x0

    cmp-long v0, v12, v3

    if-gez v0, :cond_21

    const-string v0, "\u00e2ge inconnu"

    goto :goto_15

    .line 923
    :cond_21
    cmp-long v0, v12, v36

    if-ltz v0, :cond_22

    const-string v0, "observation ancienne"

    move-object v3, v0

    goto :goto_16

    .line 924
    :cond_22
    if-nez v25, :cond_23

    const-string v0, "identit\u00e9 incompl\u00e8te"

    move-object v3, v0

    goto :goto_16

    .line 925
    :cond_23
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_24

    if-nez v10, :cond_24

    const-string v0, "attente retour 1 s"

    move-object v3, v0

    goto :goto_16

    .line 926
    :cond_24
    if-nez v1, :cond_25

    if-nez v10, :cond_25

    if-nez v2, :cond_25

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_25

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_25

    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_25

    long-to-double v3, v6

    sub-double v3, v3, v31

    .line 927
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    long-to-double v8, v8

    cmpl-double v0, v3, v8

    if-ltz v0, :cond_25

    const-string v0, "\u00e9cart >= seuil"

    move-object v3, v0

    goto :goto_16

    :cond_25
    move-object/from16 v3, v20

    .line 930
    :goto_16
    const-string v0, "\u00e9cart >= seuil"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 931
    const-wide/16 v8, 0x0

    cmpl-double v0, v41, v8

    if-lez v0, :cond_26

    const/4 v0, 0x1

    goto :goto_17

    :cond_26
    const/4 v0, -0x1

    .line 932
    :goto_17
    iget-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const-wide/16 v26, 0x0

    cmp-long v4, v8, v26

    if-ltz v4, :cond_28

    iget-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    sub-long v8, v45, v8

    cmp-long v4, v8, v43

    if-gtz v4, :cond_28

    iget v4, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    if-ne v0, v4, :cond_28

    iget-object v4, v14, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iget-object v8, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_27

    goto :goto_18

    :cond_27
    move-wide/from16 v8, v45

    goto :goto_19

    .line 933
    :cond_28
    :goto_18
    move-wide/from16 v8, v45

    iput-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const/4 v4, 0x0

    iput v4, v14, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    iput v0, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iput-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 935
    :goto_19
    iput-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    iget v0, v14, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/16 v16, 0x1

    add-int/lit8 v0, v0, 0x1

    iput v0, v14, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    .line 936
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_2b

    iget v0, v14, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v4, 0x3

    if-lt v0, v4, :cond_2b

    move v4, v1

    iget-wide v0, v14, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    sub-long v0, v8, v0

    const-wide/16 v36, 0x2710

    cmp-long v0, v0, v36

    if-ltz v0, :cond_2a

    .line 937
    move-wide/from16 v0, v31

    iput-wide v0, v14, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    move/from16 v32, v4

    move/from16 v31, v5

    long-to-double v4, v6

    sub-double/2addr v4, v0

    iput-wide v4, v14, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 938
    iget-boolean v4, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v4, :cond_29

    const/4 v4, 0x0

    iput-boolean v4, v14, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 939
    :cond_29
    const/4 v5, 0x1

    iput-boolean v5, v14, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 940
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "resynchronisation douce ; \u00e9cart r\u00e9p\u00e9t\u00e9="

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v36, v0

    move v5, v10

    move-wide/from16 v0, v41

    move-object/from16 v41, v11

    double-to-long v10, v0

    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v10, v40

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v14, v4}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 941
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_1a

    .line 936
    :cond_2a
    move-wide/from16 v36, v31

    move-wide/from16 v0, v41

    move/from16 v32, v4

    move/from16 v31, v5

    move v5, v10

    move-object/from16 v41, v11

    move-object/from16 v10, v40

    goto :goto_1a

    :cond_2b
    move-wide/from16 v36, v31

    move/from16 v32, v1

    move/from16 v31, v5

    move v5, v10

    move-object/from16 v10, v40

    move-wide/from16 v0, v41

    move-object/from16 v41, v11

    goto :goto_1a

    .line 943
    :cond_2c
    move-wide/from16 v36, v31

    move-wide/from16 v8, v45

    move/from16 v32, v1

    move/from16 v31, v5

    move v5, v10

    move-object/from16 v10, v40

    move-wide/from16 v0, v41

    move-object/from16 v41, v11

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    :goto_1a
    nop

    .line 944
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    .line 945
    nop

    .line 946
    if-eqz v4, :cond_2f

    if-nez v2, :cond_2d

    move-wide/from16 v45, v8

    iget-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v26, 0x0

    cmp-long v8, v8, v26

    if-ltz v8, :cond_2e

    iget-wide v8, v14, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v8, v6, v8

    if-eqz v8, :cond_30

    goto :goto_1b

    :cond_2d
    move-wide/from16 v45, v8

    :cond_2e
    :goto_1b
    const/4 v8, 0x1

    goto :goto_1c

    :cond_2f
    move-wide/from16 v45, v8

    :cond_30
    const/4 v8, 0x0

    .line 947
    :goto_1c
    iput-boolean v4, v14, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 948
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v11, v24

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v11, v35

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-wide/16 v26, 0x0

    cmp-long v11, v12, v26

    if-gez v11, :cond_31

    move-object/from16 v11, v34

    goto :goto_1d

    :cond_31
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    :goto_1d
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, " ; source="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v11, v14, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, " ; \u00e9tat page="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v11, v33

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, " ; \u00e9cart="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 949
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v11

    if-eqz v11, :cond_32

    :goto_1e
    move-object/from16 v0, v34

    goto :goto_1f

    :cond_32
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    double-to-long v0, v0

    invoke-virtual {v11, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    goto :goto_1e

    :goto_1f
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 950
    if-eqz v4, :cond_33

    const-string v1, "accept\u00e9e"

    goto :goto_20

    :cond_33
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "rejet\u00e9e : "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 948
    invoke-direct {v14, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 951
    if-eqz v2, :cond_36

    .line 952
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v9, -0x1

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 953
    const/4 v1, 0x0

    iput-boolean v1, v14, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v14, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v1, v14, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 954
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    const-wide/16 v9, -0x1

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 956
    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v9, v19

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v10, v23

    invoke-static {v0, v10}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    goto :goto_21

    :cond_34
    move-object/from16 v10, v23

    :goto_21
    const-wide/16 v11, -0x1

    iput-wide v11, v14, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    move-object/from16 v0, v20

    iput-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 958
    :cond_35
    move-wide/from16 v12, v38

    goto :goto_22

    .line 951
    :cond_36
    move-object/from16 v9, v19

    move-object/from16 v10, v23

    move-wide/from16 v12, v36

    .line 958
    :goto_22
    if-eqz v25, :cond_37

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v11, v14, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-le v0, v11, :cond_37

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v0, v10}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    iput-object v10, v14, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 959
    :cond_37
    if-eqz v25, :cond_38

    iput-object v9, v14, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v10, v14, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-wide/from16 v23, v6

    move-wide/from16 v6, v29

    iput-wide v6, v14, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v11, 0x1

    iput-boolean v11, v14, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_23

    :cond_38
    move-wide/from16 v23, v6

    move-wide/from16 v6, v29

    .line 960
    :goto_23
    const/4 v1, 0x0

    :try_start_8
    invoke-virtual {v14, v1}, Lcom/melodix/music/PreviewPlayerController;->highlightPlaying(Z)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_24

    :catch_3
    move-exception v0

    .line 961
    :goto_24
    :try_start_9
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3a

    if-eqz v2, :cond_39

    goto :goto_25

    :cond_39
    move-object/from16 v11, v28

    goto :goto_26

    :cond_3a
    :goto_25
    move-object/from16 v11, v28

    iput-object v11, v14, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 964
    :goto_26
    const-string v0, "previewConfirmPositionMs"

    move/from16 v19, v2

    move/from16 v16, v8

    move-object/from16 v20, v10

    move-object/from16 v28, v11

    const-wide/16 v1, -0x1

    move-object/from16 v8, p1

    invoke-virtual {v8, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 965
    if-eqz v25, :cond_3c

    const-wide/16 v1, 0x0

    cmp-long v0, v10, v1

    if-ltz v0, :cond_3c

    cmp-long v0, v10, v6

    if-gtz v0, :cond_3c

    .line 966
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_3b

    if-nez v19, :cond_3b

    iget v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_3b

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v1, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v1, v0, v1

    const-wide/16 v26, 0x0

    cmp-long v0, v1, v26

    if-ltz v0, :cond_3b

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v1, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v1, v0, v1

    const-wide/16 v26, 0x0

    cmp-long v0, v1, v26

    if-gez v0, :cond_3b

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v1, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v1, v0, v1

    cmp-long v0, v10, v1

    if-eqz v0, :cond_3b

    .line 968
    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v1, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v45, v0, v1

    .line 969
    :cond_3b
    iput-wide v10, v14, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v1, v45

    iput-wide v1, v14, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    goto :goto_27

    .line 965
    :cond_3c
    move-wide/from16 v1, v45

    .line 971
    :goto_27
    if-eqz v4, :cond_3d

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-eqz v0, :cond_3d

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_3d

    move-object/from16 v29, v9

    const/4 v9, 0x0

    iput-boolean v9, v14, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    goto :goto_28

    :cond_3d
    move-object/from16 v29, v9

    .line 972
    :goto_28
    if-eqz v5, :cond_3e

    if-eqz v4, :cond_3e

    .line 973
    const/4 v9, 0x0

    iput-boolean v9, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v9, v14, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 974
    const-string v0, "retour confirm\u00e9 par observation coh\u00e9rente ; son non v\u00e9rifi\u00e9"

    invoke-direct {v14, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 976
    :cond_3e
    nop

    .line 977
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_4a

    if-nez v19, :cond_4a

    .line 978
    nop

    .line 979
    if-eqz v31, :cond_3f

    move-wide/from16 v33, v10

    iget-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v9, v1, v9

    move-wide/from16 v35, v12

    const-wide/16 v11, 0x0

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    goto :goto_29

    :cond_3f
    move-wide/from16 v33, v10

    move-wide/from16 v35, v12

    const-wide/16 v9, 0x0

    .line 980
    :goto_29
    iget-wide v11, v14, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v11, v9

    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    .line 981
    const-wide/16 v11, 0x0

    cmp-long v0, v33, v11

    if-ltz v0, :cond_40

    cmp-long v11, v33, v6

    if-gtz v11, :cond_40

    .line 982
    move-wide/from16 v11, v33

    iput-wide v11, v14, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v1, v14, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    goto :goto_2a

    .line 981
    :cond_40
    move-wide/from16 v11, v33

    .line 984
    :goto_2a
    if-ltz v0, :cond_43

    sub-long v9, v11, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(J)J

    move-result-wide v9

    const-wide/16 v23, 0x9c4

    cmp-long v0, v9, v23

    if-lez v0, :cond_41

    goto :goto_2b

    .line 995
    :cond_41
    iget v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_42

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v4, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v1, v0, v4

    iget-object v0, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v4, v14, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v9, "position UI proche de la cible"

    aput-object v9, v0, v4

    .line 996
    :cond_42
    const/4 v4, 0x0

    iput-boolean v4, v14, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v23, 0x1

    add-long v9, v9, v23

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 997
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    .line 998
    const-wide/16 v9, -0x1

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v9, v14, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move/from16 v16, v4

    move/from16 v9, v31

    move-object/from16 v3, v41

    const/4 v0, 0x1

    goto/16 :goto_2f

    .line 985
    :cond_43
    :goto_2b
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_44

    if-nez v31, :cond_44

    invoke-direct {v14, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v5

    iput-wide v5, v14, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v14, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, v14, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 986
    :cond_44
    if-eqz v31, :cond_45

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_45

    const/4 v0, 0x1

    goto :goto_2c

    :cond_45
    const/4 v0, 0x0

    :goto_2c
    iput-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v3, 0x1

    iput-boolean v3, v14, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 987
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_47

    if-nez v4, :cond_46

    move-object/from16 v3, v41

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    goto :goto_2d

    :cond_46
    move-object/from16 v3, v41

    :goto_2d
    iput-object v15, v14, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_2e

    :cond_47
    move-object/from16 v3, v41

    .line 988
    :cond_48
    :goto_2e
    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_49

    if-eqz v4, :cond_49

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    .line 989
    iput-wide v1, v14, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    move/from16 v9, v31

    iput-boolean v9, v14, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iget-boolean v0, v14, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_49

    iput-boolean v9, v14, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 991
    :cond_49
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    return-void

    .line 977
    :cond_4a
    move-wide/from16 v35, v12

    move/from16 v9, v31

    move-object/from16 v3, v41

    .line 1000
    move-wide/from16 v11, v23

    const/4 v0, 0x0

    :goto_2f
    if-eqz v4, :cond_5e

    .line 1001
    :try_start_a
    iput-wide v6, v14, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 1002
    iget-boolean v10, v14, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v10, :cond_58

    if-nez v19, :cond_58

    if-nez v32, :cond_58

    invoke-static/range {v35 .. v36}, Ljava/lang/Double;->isNaN(D)Z

    move-result v10

    if-eqz v10, :cond_4b

    move-object/from16 v41, v3

    move v0, v4

    move-object v5, v14

    move-object v10, v15

    goto/16 :goto_35

    .line 1005
    :cond_4b
    if-eqz v5, :cond_51

    iget-boolean v5, v14, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    if-nez v5, :cond_51

    .line 1008
    if-eqz v9, :cond_4d

    long-to-double v13, v11

    sub-double v13, v13, v35

    :try_start_b
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    move-result-wide v13
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0

    const-wide v17, 0x40a7700000000000L    # 3000.0

    cmpl-double v0, v13, v17

    if-ltz v0, :cond_4c

    goto :goto_30

    :cond_4c
    const/4 v13, 0x0

    goto :goto_31

    :cond_4d
    :goto_30
    const/4 v13, 0x1

    .line 1009
    :goto_31
    if-eqz v13, :cond_4e

    move-object v10, v15

    long-to-double v14, v11

    goto :goto_32

    :cond_4e
    move-object v10, v15

    move-wide/from16 v14, v35

    :goto_32
    move-object/from16 v5, p0

    :try_start_c
    iput-wide v14, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    if-eqz v13, :cond_4f

    const-wide/16 v14, 0x0

    goto :goto_33

    :cond_4f
    long-to-double v14, v11

    sub-double v14, v14, v35

    :goto_33
    iput-wide v14, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1010
    if-eqz v13, :cond_50

    const-string v0, "retour : saut"

    goto :goto_34

    :cond_50
    const-string v0, "retour : correction <=1,25x"

    :goto_34
    invoke-direct {v5, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1011
    move-object/from16 v41, v3

    move v0, v4

    goto/16 :goto_36

    .line 1005
    :cond_51
    move-object v5, v14

    move-object v10, v15

    .line 1011
    if-eqz v0, :cond_52

    if-nez v9, :cond_52

    .line 1012
    long-to-double v13, v6

    move-object/from16 v41, v3

    move v0, v4

    move-wide/from16 v3, v35

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v13

    move-wide/from16 v17, v6

    const-wide/16 v6, 0x0

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v13

    iput-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v6, v11

    sub-double/2addr v6, v3

    iput-wide v6, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    move-wide/from16 v6, v17

    goto/16 :goto_36

    .line 1011
    :cond_52
    move-object/from16 v41, v3

    move v0, v4

    move-wide/from16 v17, v6

    move-wide/from16 v3, v35

    .line 1013
    if-eqz v16, :cond_53

    if-nez v9, :cond_53

    if-nez v21, :cond_53

    .line 1014
    move-wide/from16 v6, v17

    long-to-double v13, v6

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v3

    const-wide/16 v13, 0x0

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_36

    .line 1013
    :cond_53
    move-wide/from16 v6, v17

    .line 1015
    if-eqz v16, :cond_54

    if-nez v21, :cond_54

    .line 1016
    long-to-double v13, v6

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v13

    move-wide/from16 v17, v6

    const-wide/16 v6, 0x0

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v13

    iput-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v6, v11

    sub-double/2addr v6, v3

    iput-wide v6, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    move-wide/from16 v6, v17

    goto :goto_36

    .line 1015
    :cond_54
    move-wide/from16 v17, v6

    .line 1017
    if-eqz v22, :cond_55

    if-eqz v9, :cond_56

    if-nez v21, :cond_56

    :cond_55
    if-nez v22, :cond_57

    if-eqz v9, :cond_57

    .line 1018
    :cond_56
    move-wide/from16 v6, v17

    long-to-double v13, v6

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v3

    const-wide/16 v13, 0x0

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_36

    .line 1017
    :cond_57
    move-wide/from16 v6, v17

    goto :goto_36

    .line 1002
    :cond_58
    move-object/from16 v41, v3

    move v0, v4

    move-object v5, v14

    move-object v10, v15

    .line 1003
    :goto_35
    long-to-double v3, v11

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v3, 0x0

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1004
    if-eqz v32, :cond_59

    const-string v3, "retour d\u00e9but observ\u00e9 ; lecture non command\u00e9e"

    invoke-direct {v5, v3}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1020
    :cond_59
    :goto_36
    if-eqz v16, :cond_5b

    .line 1021
    iget-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v13, 0x0

    cmp-long v3, v3, v13

    if-ltz v3, :cond_5a

    iget-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v3, v3, v13

    if-ltz v3, :cond_5a

    if-eqz v9, :cond_5a

    .line 1022
    iget-object v3, v5, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    iget v4, v5, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v13, v1, v13

    aput-wide v13, v3, v4

    .line 1023
    iget v3, v5, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iget-object v4, v5, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v4, v4

    rem-int/2addr v3, v4

    iput v3, v5, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 1024
    iget v3, v5, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    iget-object v4, v5, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v4, v4

    if-ge v3, v4, :cond_5a

    iget v3, v5, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, v5, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 1026
    :cond_5a
    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v11, v5, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 1028
    :cond_5b
    const/4 v3, 0x1

    iput-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 1029
    iget-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v3, :cond_5c

    iget-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v3, :cond_5c

    iget-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 1030
    :cond_5c
    if-eqz v25, :cond_5d

    if-eqz v9, :cond_5d

    if-nez v21, :cond_5d

    iget-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v3, :cond_5d

    const/4 v13, 0x1

    goto :goto_37

    :cond_5d
    const/4 v13, 0x0

    :goto_37
    iput-boolean v13, v5, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_39

    .line 1052
    :catch_4
    move-exception v0

    move-object v5, v14

    goto/16 :goto_3d

    .line 1031
    :cond_5e
    move-object/from16 v41, v3

    move v0, v4

    move-object v5, v14

    move-object v10, v15

    move-wide/from16 v3, v35

    iget-boolean v13, v5, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v13, :cond_62

    if-nez v19, :cond_62

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v13

    if-nez v13, :cond_62

    .line 1032
    if-eqz v9, :cond_5f

    if-eqz v21, :cond_60

    :cond_5f
    iget-boolean v13, v5, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v13, :cond_60

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v3, 0x0

    iput-wide v3, v5, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1033
    :cond_60
    if-eqz v9, :cond_61

    if-nez v21, :cond_61

    iget-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v3, :cond_61

    const/4 v13, 0x1

    goto :goto_38

    :cond_61
    const/4 v13, 0x0

    :goto_38
    iput-boolean v13, v5, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_39

    .line 1034
    :cond_62
    const/4 v3, 0x0

    iput-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 1035
    :goto_39
    iget-boolean v4, v5, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_64

    if-nez v0, :cond_63

    move-object/from16 v4, v41

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_65

    goto :goto_3a

    :cond_63
    move-object/from16 v4, v41

    :goto_3a
    iput-object v10, v5, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_3b

    :cond_64
    move-object/from16 v4, v41

    .line 1036
    :cond_65
    :goto_3b
    const/4 v13, 0x1

    iput-boolean v13, v5, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 1037
    iget-boolean v14, v5, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v14, :cond_67

    if-eqz v0, :cond_67

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_67

    .line 1038
    iput-wide v1, v5, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    .line 1039
    iput-boolean v9, v5, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 1040
    iget-boolean v14, v5, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v14, :cond_66

    iget-boolean v14, v5, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-ne v9, v14, :cond_66

    const/4 v3, 0x0

    iput-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v17, 0x1

    add-long v13, v13, v17

    iput-wide v13, v5, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 1041
    :cond_66
    iget-boolean v3, v5, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v3, :cond_67

    iput-boolean v9, v5, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 1043
    :cond_67
    if-eqz v0, :cond_68

    if-eqz v25, :cond_68

    iget-boolean v0, v5, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_68

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5

    if-nez v0, :cond_68

    .line 1044
    move-wide v13, v1

    move-object v15, v4

    move-object/from16 v1, p0

    move-object v2, v8

    const/4 v8, 0x1

    move-object/from16 v3, v29

    move-object/from16 v4, v20

    move-wide/from16 v45, v13

    move v13, v9

    move-object v9, v5

    move-object v5, v10

    move-wide/from16 v17, v6

    move-wide v6, v11

    move v12, v8

    move-object v11, v9

    move-wide/from16 v47, v45

    move-wide/from16 v8, v17

    :try_start_d
    invoke-direct/range {v1 .. v9}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    goto :goto_3c

    .line 1043
    :cond_68
    move-wide/from16 v47, v1

    move-object v15, v4

    move-object v11, v5

    move v13, v9

    const/4 v12, 0x1

    .line 1045
    :goto_3c
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 1046
    const-string v0, "apr\u00e8s mesure"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1047
    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_6b

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_6b

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_6b

    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->operation:I

    if-ne v0, v12, :cond_69

    .line 1048
    invoke-virtual {v10, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_69

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eq v13, v0, :cond_6a

    :cond_69
    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->operation:I

    if-eq v0, v12, :cond_6b

    .line 1049
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6b

    iget-object v0, v11, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v1, v28

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6b

    .line 1050
    :cond_6a
    move-wide/from16 v1, v47

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->uiAt:J
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_7

    .line 1056
    :cond_6b
    goto :goto_40

    .line 1052
    :catch_5
    move-exception v0

    :goto_3d
    move-object v11, v5

    goto :goto_3e

    :catch_6
    move-exception v0

    move-object v11, v14

    goto :goto_3e

    :catch_7
    move-exception v0

    .line 1053
    :goto_3e
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {v11, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    .line 1054
    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_6c

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_6c

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_3f

    :cond_6c
    const/4 v1, 0x0

    .line 1055
    :goto_3f
    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v0, "mesure rejet\u00e9e : format invalide"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 1057
    :goto_40
    return-void
.end method

.method public tapPlayPause()I
    .locals 7

    .line 1067
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 1068
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

    .line 1069
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 1070
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 1071
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

    .line 1073
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

    .line 1074
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 1075
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 1076
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1077
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$10;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$10;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v0, 0x1f40

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1084
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    return v0

    .line 1067
    :cond_7
    :goto_1
    return v1
.end method
