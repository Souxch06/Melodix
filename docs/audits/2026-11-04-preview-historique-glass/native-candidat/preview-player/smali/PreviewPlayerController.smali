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

.field static live:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/melodix/music/PreviewPlayerController;",
            ">;"
        }
    .end annotation
.end field

.field static playingNow:Z

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

.field private advancedFor:Ljava/lang/String;

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

.field private detailKey:Ljava/lang/String;

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

.field private queueCommandAt:J

.field private queueLastAt:J

.field private queueLastDur:J

.field private queueLastPos:J

.field private queueTrack:Ljava/lang/String;

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

    .line 1177
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

    .line 595
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

    .line 648
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 788
    new-instance v2, Lcom/melodix/music/PreviewPlayerController$7;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerController$7;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    .line 802
    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->detailKey:Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->queueTrack:Ljava/lang/String;

    .line 803
    const-wide/32 v2, -0x186a0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->queueCommandAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastPos:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastDur:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastAt:J

    .line 918
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarkAt:J

    .line 1176
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    .line 1182
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$11;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$11;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    .line 1338
    const-string v0, "non relev\u00e9"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    const-string v0, "aucune ligne vue"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowKeys:Ljava/lang/String;

    .line 596
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    .line 597
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    if-eqz p1, :cond_0

    .line 598
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 599
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 600
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 601
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTitle:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedArtist:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 602
    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedTrack:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    sget-object p1, Lcom/melodix/music/PreviewPlayerController;->savedState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAbsenceAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    .line 603
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 604
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 606
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

.method static synthetic access$4508(Lcom/melodix/music/PreviewPlayerController;)I
    .locals 2

    .line 34
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarks:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarks:I

    return v0
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

    .line 630
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

    .line 631
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

    .line 887
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

    .line 888
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

    .line 1189
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

    .line 1179
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 1180
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

    .line 1181
    :cond_2
    return-void
.end method

.method private dominantPhase()Ljava/lang/String;
    .locals 18

    .line 1207
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

    .line 1209
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

    .line 1210
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

    .line 1211
    const-string v1, "r\u00e9ception \u2192 rendu natif"

    const-string v2, "rendu \u2192 frame"

    const-string v8, "attente pont"

    const-string v9, "navigation \u2192 page pr\u00eate"

    const-string v10, "page/pont \u2192 lignes re\u00e7ues"

    filled-new-array {v8, v9, v10, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 1212
    nop

    .line 1213
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

    .line 1214
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

    .line 1208
    :cond_5
    :goto_3
    const-string v1, "ind\u00e9termin\u00e9e (phases manquantes ou non s\u00e9quentielles)"

    return-object v1
.end method

.method static expect()V
    .locals 1

    .line 861
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/PreviewPlayerController;

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->expectPlaying()V

    :cond_1
    return-void
.end method

.method static flagsSetTrue(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1357
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 1358
    const-string v1, "window\\.(__sf[A-Za-z0-9_]*)\\s*=\\s*(?:!0|true)\\b"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 1359
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

    .line 1360
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

    .line 1361
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

    .line 696
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 697
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 698
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v3

    .line 699
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v5

    if-nez v5, :cond_0

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 700
    :cond_0
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->absenceAt:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    .line 701
    const-string v1, "interrupted"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v0, v5

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 702
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 703
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

    .line 704
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

    .line 703
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 705
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 706
    return-void
.end method

.method static headerPlaying()Z
    .locals 2

    .line 859
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/PreviewPlayerController;

    :goto_0
    if-eqz v0, :cond_1

    sget-boolean v1, Lcom/melodix/music/PreviewPlayerController;->playingNow:Z

    if-eqz v1, :cond_1

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController;->lit:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method private hotfixFlags()Ljava/lang/String;
    .locals 9

    .line 1341
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

    .line 1342
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {v2}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v4, "hotfixes/spotify_bridge.js"

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1343
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    const-string v0, "absent"

    return-object v0

    .line 1344
    :cond_1
    new-instance v2, Ljava/lang/String;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->readAll(Ljava/io/InputStream;)[B

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v2, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1346
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

    .line 1347
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x28

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1348
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

    .line 1349
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

    .line 1350
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

    .line 638
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 639
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

    .line 640
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

    .line 922
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 923
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

    .line 924
    :cond_0
    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeMarkAt:J

    .line 925
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

    .line 926
    :goto_0
    return-void

    .line 923
    :cond_1
    :goto_1
    return-void
.end method

.method private now()J
    .locals 2

    .line 614
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

    .line 1203
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

    .line 616
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

    .line 619
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_0

    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1

    .line 620
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_1

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    return-wide p1

    .line 621
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 622
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_2

    move-wide v0, p1

    .line 625
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

    .line 626
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    long-to-double p1, p1

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    mul-double/2addr v6, p1

    .line 627
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

    .line 1191
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_0

    const-string v0, "lecture interrompue au d\u00e9part ; audio non v\u00e9rifi\u00e9"

    return-object v0

    .line 1192
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const-string v0, "\u00e9tat du lecteur indisponible"

    return-object v0

    .line 1193
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_2

    const-string v0, "pause demand\u00e9e"

    return-object v0

    .line 1194
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    return-object v0

    .line 1195
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "lecture en pause"

    return-object v0

    .line 1196
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_5

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    return-object v0

    .line 1197
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_6

    const-string v0, "position ou dur\u00e9e indisponible"

    return-object v0

    .line 1198
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_7

    const-string v0, "mouvement arr\u00eat\u00e9"

    return-object v0

    .line 1199
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

    .line 1200
    :cond_8
    const-string v0, "animation active"

    return-object v0
.end method

.method private queuePlay(Ljava/lang/String;)Z
    .locals 4

    .line 827
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 828
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    const-string v2, "spotify:track:[A-Za-z0-9]+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 829
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->queueCommandAt:J

    const-string v2, ""

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastPos:J

    .line 830
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(function(){if(typeof window.__sfNativeOpenUri===\'function\')window.__sfNativeOpenUri(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "\')})()"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 831
    nop

    .line 832
    const/4 p1, 0x1

    return p1

    .line 831
    :catch_0
    move-exception p1

    return v1

    .line 828
    :cond_1
    :goto_0
    return v1
.end method

.method static readAll(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1353
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x4000

    new-array v1, v1, [B

    .line 1354
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

    .line 910
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

    .line 911
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 912
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

    .line 910
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
    .locals 7

    .line 871
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_d

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_0

    goto/16 :goto_6

    .line 874
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

    .line 875
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

    .line 876
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

    .line 877
    :cond_4
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    .line 878
    :cond_5
    if-ne v3, v4, :cond_6

    const-string v1, "Mettre en pause"

    goto :goto_2

    :cond_6
    const-string v1, "Lire"

    goto :goto_2

    .line 877
    :cond_7
    :goto_1
    const-string v1, "\u00c9tat de lecture inconnu"

    .line 879
    :goto_2
    const v2, 0x7f090238

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v5, 0x7f09023e

    invoke-virtual {v0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 880
    instance-of v6, v2, Landroid/widget/ImageView;

    if-eqz v6, :cond_8

    move-object v6, v2

    check-cast v6, Landroid/widget/ImageView;

    invoke-virtual {v6, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 881
    :cond_8
    instance-of v2, v5, Landroid/widget/ImageView;

    if-eqz v2, :cond_9

    move-object v2, v5

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v5, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 882
    :cond_9
    sget-boolean v1, Lcom/melodix/music/PreviewPlayerController;->playingNow:Z

    const/4 v2, 0x0

    if-ne v3, v4, :cond_a

    const/4 v3, 0x1

    goto :goto_3

    :cond_a
    move v3, v2

    :goto_3
    sput-boolean v3, Lcom/melodix/music/PreviewPlayerController;->playingNow:Z

    .line 883
    sget-boolean v3, Lcom/melodix/music/PreviewPlayerController;->playingNow:Z

    if-eq v1, v3, :cond_c

    const v1, 0x7f09022f

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_b

    const/4 v0, 0x0

    goto :goto_4

    :cond_b
    const-string v1, "melodixPlayAll"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 884
    :goto_4
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_c

    :goto_5
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_c

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 885
    :cond_c
    return-void

    .line 871
    :cond_d
    :goto_6
    return-void
.end method

.method private renderProgress()V
    .locals 17

    .line 656
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return-void

    .line 659
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

    .line 660
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

    .line 661
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 662
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

    .line 663
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

    .line 664
    const-string v2, "-:--"

    invoke-direct {v0, v1, v13, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    invoke-direct {v0, v1, v12, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 665
    const/4 v2, 0x0

    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    invoke-direct {v0, v1, v10, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 666
    invoke-virtual {v1, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 667
    if-nez v1, :cond_3

    const/4 v7, 0x0

    goto :goto_0

    :cond_3
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 668
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

    .line 669
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 670
    :cond_4
    return-void

    .line 672
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v14

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    .line 673
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    double-to-long v14, v14

    move-object/from16 v16, v8

    iget-wide v7, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v7, v14

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 674
    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v9, 0x3e8

    div-long v4, v14, v9

    cmp-long v12, v12, v4

    if-eqz v12, :cond_6

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v14, v15}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 675
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

    .line 676
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

    .line 677
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

    .line 678
    invoke-direct {v0, v1, v11, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v3, 0x7f09023d

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 679
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const v3, 0x7f09024a

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const v3, 0x7f09024b

    invoke-direct {v0, v1, v3, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 680
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 681
    if-nez v1, :cond_9

    const/4 v7, 0x0

    goto :goto_1

    :cond_9
    move-object/from16 v2, v16

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 682
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

    .line 683
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 684
    :cond_a
    return-void
.end method

.method private report()Ljava/lang/String;
    .locals 17

    .line 1217
    move-object/from16 v1, p0

    const-string v2, "non lisible"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1218
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

    .line 1219
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1220
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1221
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, v1, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1222
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

    .line 1223
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

    .line 1224
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1225
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

    .line 1226
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1227
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

    .line 1228
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1229
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

    .line 1230
    const-string v0, "\nPlaylist : mesure pr\u00e9c\u00e9dente appui \u2192 frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1231
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

    .line 1232
    const-string v4, " (peut concerner une autre playlist ; comparaison indicative)"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1233
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1236
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

    .line 1237
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

    .line 1238
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

    .line 1239
    goto :goto_a

    :catch_0
    move-exception v0

    const-string v0, "\nPage Spotify : non lisible"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1242
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

    .line 1244
    :try_start_1
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1245
    if-eqz v0, :cond_c

    const-string v9, "(function(){try{var w=window;var r=[w.__sfMelodixBridgeStarted===true,w.__sfMelodixBridgeCompleted===true,String(w.__sfBridgeExecMode||\'-\'),String(w.__sfBridgeLastError||\'-\'),w.__sfBridgeCspViolation?1:0,w.__sfBridgeBytes|0,String(w.__sfBridgeLoadStage||\'-\').slice(0,40),w.__sfBridgeIntercepted===true,w.__sfBridgeServedBytes|0,!!(navigator.serviceWorker&&navigator.serviceWorker.controller),w.__sfBridgeEntered===true,Math.round(performance.now()/1000)+\' s\',w.__spotiduck_bridge_applied===true,typeof w.fetchMediaItems].join(\' ; \');return r}catch(e){return \'erreur\'}})()"

    new-instance v10, Lcom/melodix/music/PreviewPlayerController$13;

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController$13;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v9, v10}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1247
    :cond_c
    goto :goto_b

    :catch_1
    move-exception v0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeState:Ljava/lang/String;

    .line 1250
    :goto_b
    const-string v0, "\nPont t\u00e9l\u00e9charg\u00e9 (taille ; drapeaux pos\u00e9s \u00e0 true) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->hotfixFlags()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1251
    const-string v0, "\nDrapeaux __sf vrais dans la page (relev\u00e9 \u00e0 l\'ouverture) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1253
    const-string v0, "\nChamps d\'une ligne de titre (noms seulement) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->rowKeys:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1254
    const-string v0, "\nFonctions du pont utiles au menu (noms seulement) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v1, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1256
    :try_start_2
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1257
    if-eqz v0, :cond_d

    const-string v9, "(function(){try{return Object.keys(window).filter(function(k){return typeof window[k]===\'function\'&&/queue|album|artist|share|playlist|context|menu|add|remove/i.test(k)}).sort().join(\',\').slice(0,900)}catch(e){return \'erreur\'}})()"

    new-instance v10, Lcom/melodix/music/PreviewPlayerController$14;

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController$14;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v9, v10}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1259
    :cond_d
    goto :goto_c

    :catch_2
    move-exception v0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->menuFns:Ljava/lang/String;

    .line 1261
    :goto_c
    :try_start_3
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekWeb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 1262
    if-eqz v0, :cond_e

    const-string v9, "(function(){try{return Object.keys(window).filter(function(k){return /^__sf/.test(k)&&window[k]===true}).sort().join(\',\').slice(0,900)}catch(e){return \'erreur\'}})()"

    new-instance v10, Lcom/melodix/music/PreviewPlayerController$15;

    invoke-direct {v10, v1}, Lcom/melodix/music/PreviewPlayerController$15;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {v0, v9, v10}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 1264
    :cond_e
    goto :goto_d

    :catch_3
    move-exception v0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->pageFlags:Ljava/lang/String;

    .line 1265
    :goto_d
    const-string v0, "\nSource position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1266
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

    .line 1267
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1268
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

    .line 1269
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1270
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

    .line 1271
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1272
    const-string v0, " ; appui \u2192 navigation : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1273
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

    .line 1274
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1275
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

    .line 1276
    const-string v0, " ; r\u00e9ception \u2192 rendu natif : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->receivedAt:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1277
    const-string v0, " ; rendu \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v11, v1, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v13, v1, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {v1, v11, v12, v13, v14}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1278
    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->likedCollection:Z

    if-eqz v0, :cond_16

    const-string v0, "\nLik\u00e9s : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->likedObservation:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1279
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

    .line 1280
    :cond_16
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1281
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

    .line 1282
    const-string v0, "\nSeek \u2014 8 derniers gestes (dur\u00e9es depuis le rel\u00e2chement) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1283
    iget v0, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-nez v0, :cond_1a

    const-string v0, " aucun"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1284
    :cond_1a
    const/4 v0, 0x0

    move v2, v0

    :goto_16
    iget v9, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagCount:I

    if-ge v2, v9, :cond_1c

    .line 1285
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

    .line 1286
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

    .line 1287
    invoke-direct {v1, v12, v13, v14, v15}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1288
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

    .line 1289
    const-string v11, " ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v12, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagResult:[Ljava/lang/String;

    aget-object v12, v12, v9

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, ")"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1290
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

    .line 1291
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

    .line 1292
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    aget-object v5, v5, v9

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1293
    const-string v4, " ; \u00e2ge derni\u00e8re observation re\u00e7ue au rel\u00e2chement : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1294
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

    .line 1284
    add-int/lit8 v2, v2, 0x1

    move-object v5, v6

    const/4 v4, 0x1

    const-wide/16 v6, 0x0

    goto/16 :goto_16

    .line 1296
    :cond_1c
    move-object v6, v5

    const-string v2, "\nSeek : observation UI p\u00e9riodique (~1 s), potentiellement d\u00e9j\u00e0 p\u00e9rim\u00e9e ; un changement peut \u00eatre la progression normale. Fin JS \u2260 accus\u00e9 Spotify ; position UI \u2260 son. D\u00e9lai Spotify/audio non isolable ici."

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1297
    const-string v2, "\nIntervalles position : "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1298
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v2, :cond_1d

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1299
    :cond_1d
    move v2, v0

    :goto_18
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-ge v2, v4, :cond_1f

    .line 1300
    if-lez v2, :cond_1e

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1301
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

    .line 1302
    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v4, v5, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1299
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 1304
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

    .line 1305
    const-string v2, "\n\u00c2ge depuis observation JS, pas fra\u00eecheur garantie c\u00f4t\u00e9 Spotify."

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1306
    const-string v2, "\nRetour \u2014 20 derniers \u00e9v\u00e9nements (horloge monotone Android) :"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1307
    move v2, v0

    :goto_1a
    iget v4, v1, Lcom/melodix/music/PreviewPlayerController;->returnEventCount:I

    const-string v5, "\n"

    if-ge v2, v4, :cond_21

    .line 1308
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

    .line 1309
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->returnEvents:[Ljava/lang/String;

    aget-object v4, v6, v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1307
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 1311
    :cond_21
    const-string v2, "\nRetour \u2014 relev\u00e9s pendant 10 secondes :"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1312
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

    .line 1313
    :cond_22
    const-string v2, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1314
    nop

    :goto_1c
    iget v2, v1, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-ge v0, v2, :cond_23

    .line 1315
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

    .line 1316
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v2, v6, v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1314
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .line 1318
    :cond_23
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1319
    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1320
    invoke-static {}, Lcom/melodix/music/PreviewPlayerVolume;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1321
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->diagnosticReport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1322
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private resetDivergence()V
    .locals 2

    .line 707
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

    .line 650
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 651
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 652
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

    .line 653
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

    .line 652
    :goto_0
    return v1
.end method

.method private saveInProcess()V
    .locals 2

    .line 608
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedValid:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedMoving:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedIdentity:Z

    .line 609
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerController;->savedInterrupted:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedFrozenPosition:D

    .line 610
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedBase:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedCorrection:D

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedAnchor:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedDuration:J

    .line 611
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->savedMeasurementPosition:J

    .line 612
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

    .line 613
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

    .line 891
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

    .line 892
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 3

    .line 728
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 729
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

    .line 634
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 635
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

    .line 636
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 1

    .line 686
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 687
    instance-of p2, p1, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_1

    .line 688
    check-cast p1, Landroid/widget/ProgressBar;

    .line 689
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    move-result p2

    const/16 v0, 0x3e8

    if-eq p2, v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 690
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p2

    if-eq p2, p3, :cond_1

    invoke-virtual {p1, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 692
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

    .line 1364
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1365
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 1366
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$17;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$17;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    .line 1367
    const-string v0, "Copier"

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1372
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1373
    return-void

    .line 1364
    :cond_1
    :goto_0
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .line 754
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v0, p1

    .line 755
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

    .line 756
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

    .line 758
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 759
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

    .line 760
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v5

    .line 761
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

    .line 762
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

    .line 763
    :goto_2
    const v1, 0x7f09024d

    const v2, 0x7f09023d

    filled-new-array {v1, v2}, [I

    move-result-object v1

    .line 764
    nop

    :goto_3
    const/4 v2, 0x2

    if-ge v3, v2, :cond_7

    .line 765
    const/4 v5, 0x0

    if-nez v0, :cond_3

    move-object v6, v5

    goto :goto_4

    :cond_3
    aget v6, v1, v3

    invoke-virtual {v0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 766
    :goto_4
    nop

    .line 767
    if-eqz v4, :cond_4

    instance-of v7, v6, Landroid/widget/ProgressBar;

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 768
    check-cast v6, Landroid/widget/ProgressBar;

    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 769
    instance-of v7, v6, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v7, :cond_4

    .line 770
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 771
    check-cast v6, Landroid/graphics/drawable/LayerDrawable;

    const v5, 0x102000d

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 774
    :cond_4
    if-nez v5, :cond_5

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    goto :goto_5

    .line 775
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

    .line 776
    :cond_6
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 777
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v5, v6, v3

    .line 778
    const/16 v6, 0x96

    const/16 v7, 0xff

    filled-new-array {v6, v7}, [I

    move-result-object v6

    const-string v7, "alpha"

    invoke-static {v5, v7, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 779
    const-wide/16 v6, 0x640

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 780
    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 781
    const/4 v2, -0x1

    invoke-virtual {v5, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 782
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v5, v2, v3

    .line 783
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 764
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 785
    :cond_7
    return-void
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 0

    .line 642
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 643
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 644
    :cond_0
    return-void
.end method

.method static togglePlayback(Landroid/app/Activity;)V
    .locals 1

    .line 860
    const v0, 0x7f090238

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

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

    .line 694
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    return-void
.end method

.method public activityResumed()V
    .locals 13

    .line 709
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 710
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

    .line 711
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const/4 v2, 0x0

    iput v2, p0, Lcom/melodix/music/PreviewPlayerController;->returnSecondCount:I

    .line 712
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

    .line 714
    :goto_1
    const/4 v9, 0x0

    if-eqz v3, :cond_2

    sget-object v10, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    if-eqz v10, :cond_2

    sget-object v10, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    sput-object v9, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-virtual {p0, v10}, Lcom/melodix/music/PreviewPlayerController;->snapshot(Ljava/lang/String;)V

    .line 716
    :cond_2
    iget-boolean v10, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v10, :cond_3

    sget-boolean v10, Lcom/melodix/music/PreviewPlayerController;->bgPlaying:Z

    if-eqz v10, :cond_3

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v3, :cond_3

    .line 717
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    .line 718
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

    .line 719
    const-string v2, "playing"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 720
    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 721
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

    .line 723
    :cond_3
    sput-wide v6, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sput-object v9, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 724
    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->foregroundSince:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 725
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

    .line 726
    return-void
.end method

.method public activityStarted()V
    .locals 1

    .line 693
    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void
.end method

.method public activityStopped()V
    .locals 1

    .line 749
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_0

    const-string v0, "onStop (sans onPause observ\u00e9)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->freezeForBackground(Ljava/lang/String;)V

    .line 750
    :cond_0
    const-string v0, "onStop ; position fig\u00e9e ; signal audio natif=non lu (incertain)"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 751
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->saveInProcess()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->dragging:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 752
    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .line 1185
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$12;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$12;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1188
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

    .line 1165
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 1166
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 1169
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    :cond_0
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz p1, :cond_1

    .line 1170
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

    .line 1171
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    const p1, 0x3ee66666    # 0.45f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 1172
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1174
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

    .line 1183
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

    .line 894
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 895
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    .line 896
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 897
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    const-wide/16 v2, 0x0

    if-eqz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    .line 898
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 899
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long p2, v4, v0

    if-gtz p2, :cond_1

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v4, v0, v4

    sput-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 901
    :cond_1
    iget-boolean p2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz p2, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p2, v4, v2

    if-ltz p2, :cond_2

    .line 902
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v4, v0, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long p2, v4, v2

    if-gez p2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 904
    :cond_2
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 905
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez p1, :cond_3

    return-void

    .line 906
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 907
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

    .line 908
    :cond_6
    return-void
.end method

.method expectPlaying()V
    .locals 4

    .line 864
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 865
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 866
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 867
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$8;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$8;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v0, 0x1f40

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 869
    return-void

    .line 864
    :cond_1
    :goto_0
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

.method public queueSkip(Z)Z
    .locals 6

    .line 815
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 817
    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    invoke-static {v0, v0}, Lcom/melodix/music/PreviewPlayerControllerQueue;->step(ZZ)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 820
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v2

    .line 821
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result p1

    if-nez p1, :cond_2

    const-wide v4, 0x40a7700000000000L    # 3000.0

    cmpl-double p1, v2, v4

    if-lez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    sget p1, Lcom/melodix/music/PreviewPlayerMode;->repeatMode:I

    if-ne p1, v0, :cond_3

    goto :goto_0

    :cond_3
    move v0, v1

    :goto_0
    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerControllerQueue;->step(ZZ)Ljava/lang/String;

    move-result-object p1

    .line 822
    :goto_1
    if-nez p1, :cond_4

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->current()Ljava/lang/String;

    move-result-object p1

    .line 824
    :cond_4
    :goto_2
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->queuePlay(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public queueStart(Ljava/lang/String;)V
    .locals 4

    .line 806
    if-eqz p1, :cond_4

    :try_start_0
    const-string v0, "spotify:track:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 807
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 808
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->onDetail:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->detailKey:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "melodix_playlists"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->detailKey:Ljava/lang/String;

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 809
    :cond_1
    if-eqz v1, :cond_2

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerControllerQueue;->start(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 810
    :cond_3
    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V

    .line 811
    :goto_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->queueCommandAt:J

    const-string p1, ""

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastPos:J

    .line 812
    return-void

    .line 806
    :cond_4
    :goto_1
    return-void
.end method

.method queueTick(Ljava/lang/String;JJ)V
    .locals 10

    .line 836
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    .line 837
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->current()Ljava/lang/String;

    move-result-object v2

    .line 838
    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerController;->queueCommandAt:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0xfa0

    cmp-long v3, v3, v5

    if-gez v3, :cond_1

    return-void

    .line 839
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x2

    const-string v5, ""

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x1

    if-nez v3, :cond_8

    .line 840
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerQueue;->moveTo(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastPos:J

    return-void

    .line 842
    :cond_2
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastDur:J

    cmp-long p1, p1, v7

    if-lez p1, :cond_3

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastPos:J

    iget-wide p3, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastDur:J

    const-wide/16 v7, 0x1f40

    sub-long/2addr p3, v7

    cmp-long p1, p1, p3

    if-ltz p1, :cond_3

    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastAt:J

    sub-long/2addr v0, p1

    const-wide/16 p1, 0x2ee0

    cmp-long p1, v0, p1

    if-gez p1, :cond_3

    move p1, v9

    goto :goto_0

    :cond_3
    move p1, v6

    .line 843
    :goto_0
    if-nez p1, :cond_4

    const/4 v2, 0x0

    goto :goto_1

    :cond_4
    sget p1, Lcom/melodix/music/PreviewPlayerMode;->repeatMode:I

    if-ne p1, v4, :cond_5

    goto :goto_1

    :cond_5
    sget p1, Lcom/melodix/music/PreviewPlayerMode;->repeatMode:I

    if-ne p1, v9, :cond_6

    move v6, v9

    :cond_6
    invoke-static {v9, v6}, Lcom/melodix/music/PreviewPlayerControllerQueue;->step(ZZ)Ljava/lang/String;

    move-result-object v2

    .line 844
    :goto_1
    if-eqz v2, :cond_7

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->queuePlay(Ljava/lang/String;)Z

    goto :goto_2

    :cond_7
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V

    .line 845
    :goto_2
    return-void

    .line 847
    :cond_8
    cmp-long v2, p4, v7

    if-lez v2, :cond_e

    cmp-long v2, p2, v7

    if-gez v2, :cond_9

    goto :goto_4

    .line 848
    :cond_9
    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastPos:J

    iput-wide p4, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastDur:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->queueLastAt:J

    .line 849
    const-wide/16 v0, 0x1388

    sub-long v0, p4, v0

    cmp-long v0, p2, v0

    if-gez v0, :cond_a

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    .line 850
    :cond_a
    const-wide/16 v0, 0x5dc

    sub-long/2addr p4, v0

    cmp-long p2, p2, p4

    if-ltz p2, :cond_d

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_d

    .line 851
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->advancedFor:Ljava/lang/String;

    .line 852
    sget p2, Lcom/melodix/music/PreviewPlayerMode;->repeatMode:I

    if-ne p2, v4, :cond_b

    goto :goto_3

    :cond_b
    sget p1, Lcom/melodix/music/PreviewPlayerMode;->repeatMode:I

    if-ne p1, v9, :cond_c

    move v6, v9

    :cond_c
    invoke-static {v9, v6}, Lcom/melodix/music/PreviewPlayerControllerQueue;->step(ZZ)Ljava/lang/String;

    move-result-object p1

    .line 853
    :goto_3
    if-eqz p1, :cond_d

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerController;->queuePlay(Ljava/lang/String;)Z

    .line 855
    :cond_d
    return-void

    .line 847
    :cond_e
    :goto_4
    return-void

    .line 836
    :cond_f
    :goto_5
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
    .locals 11

    .line 562
    const-string v0, "detail"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "id"

    const-string v3, "uri"

    const-string v4, ""

    const/4 v5, 0x0

    if-eqz v1, :cond_4

    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move v6, v5

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_3

    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 563
    if-eqz v7, :cond_2

    invoke-virtual {v7, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v3, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "spotify:track:"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    .line 564
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_0

    move-object v7, v4

    goto :goto_2

    :cond_0
    const-string v7, ","

    :goto_2
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 564
    :catch_0
    move-exception v1

    :cond_3
    :goto_3
    nop

    .line 565
    :cond_4
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    .line 566
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->detailKey:Ljava/lang/String;

    .line 567
    :cond_5
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
    move-exception v6

    .line 570
    :goto_4
    nop

    .line 571
    :try_start_2
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-nez v6, :cond_7

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/Activity;

    const/4 v7, 0x0

    if-nez v6, :cond_6

    :goto_5
    goto :goto_6

    :cond_6
    const-string v8, "melodix_playlists"

    invoke-virtual {v6, v8, v5}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v8, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_5

    :goto_6
    if-eqz v7, :cond_7

    goto :goto_7

    :cond_7
    move-object v7, p3

    goto :goto_7

    :catch_2
    move-exception v6

    move-object v7, p3

    .line 572
    :goto_7
    nop

    .line 575
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->onDetail:Z

    if-eqz v6, :cond_8

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/Activity;

    if-eqz v6, :cond_8

    :try_start_3
    invoke-static {v6, v7}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_8

    :catch_3
    move-exception v6

    .line 576
    :cond_8
    :goto_8
    const-string v6, "home"

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-wide/16 v7, 0x0

    if-eqz v6, :cond_9

    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v6, v9, v7

    if-ltz v6, :cond_9

    sget-wide v9, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v6, v9, v7

    if-gez v6, :cond_9

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 577
    :cond_9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    if-eqz p2, :cond_a

    :try_start_4
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p2, v6}, Lcom/melodix/music/PreviewPlayerController;->storeRows(Ljava/lang/String;Lorg/json/JSONArray;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_9

    :catch_4
    move-exception v6

    .line 578
    :cond_a
    :goto_9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-wide v9, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long p1, v9, v7

    if-ltz p1, :cond_f

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->playlistKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    .line 580
    :try_start_5
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 581
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->storableRows(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-lez p2, :cond_b

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->shownTracks:I

    iget p3, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    if-gez p3, :cond_b

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController;->firstTracks:I

    .line 582
    :cond_b
    nop

    :goto_a
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-ge v5, p2, :cond_e

    .line 583
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p2

    .line 584
    if-eqz p2, :cond_d

    invoke-virtual {p2, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, v3, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "(?i)^spotify:track:[a-z0-9]+$"

    invoke-virtual {p2, p3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_d

    .line 585
    iget-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long p1, p1, v7

    if-gez p1, :cond_c

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 586
    :cond_c
    const-string p1, "data:unknown"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 587
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_b

    .line 582
    :cond_d
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 590
    :catch_5
    move-exception p1

    :cond_e
    :goto_b
    nop

    .line 592
    :cond_f
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 593
    return-void
.end method

.method public run()V
    .locals 12

    .line 731
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 732
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 733
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 734
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 735
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

    .line 736
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

    .line 737
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

    .line 738
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v6

    .line 739
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

    .line 740
    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 741
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

    .line 742
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

    .line 744
    :cond_5
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 745
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_6

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 746
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    .line 747
    return-void

    .line 732
    :cond_7
    :goto_3
    return-void
.end method

.method public showDiagnostics()V
    .locals 5

    .line 1327
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 1330
    :cond_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeSeq:I

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    .line 1331
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    const-wide/16 v3, 0x1388

    add-long/2addr v1, v3

    .line 1332
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$16;

    invoke-direct {v4, p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController$16;-><init>(Lcom/melodix/music/PreviewPlayerController;IJ)V

    const-wide/16 v0, 0x96

    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1336
    return-void
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 53

    .line 928
    move-object/from16 v11, p0

    move-object/from16 v7, p1

    const-string v8, "range"

    const-string v9, "none"

    const-string v0, "previewPlaybackState"

    const-string v10, "previewProgressValid"

    const-string v1, "playing"

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->markBridge()V

    .line 930
    :try_start_0
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 931
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v5

    .line 932
    invoke-virtual {v15, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7

    const-string v3, "artist"

    const-string v4, "track"

    const-string v12, ""

    move-object/from16 v16, v15

    const-wide/16 v14, -0x1

    if-nez v2, :cond_4

    .line 933
    :try_start_1
    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    const-string v0, "callback legacy ignor\u00e9 en arri\u00e8re-plan"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    return-void

    .line 937
    :cond_0
    move-object/from16 v2, v16

    invoke-virtual {v2, v4, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 940
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

    .line 941
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 942
    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v14, v11, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    iput-object v12, v11, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    goto :goto_0

    .line 943
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

    .line 944
    :cond_3
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 945
    return-void

    .line 947
    :cond_4
    move-object/from16 v2, v16

    invoke-virtual {v2, v4, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 948
    const-string v13, "previewTrackUri"

    invoke-virtual {v2, v13, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 949
    const-string v14, "previewPositionMs"

    move-object/from16 v19, v3

    move-object v15, v4

    move-object/from16 v20, v13

    const-wide/16 v3, -0x1

    invoke-virtual {v2, v14, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v13

    const-string v3, "previewDurationMs"

    move-wide/from16 v21, v5

    move-object/from16 v23, v8

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 950
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7

    move-object/from16 v5, v20

    const-string v3, "paused"

    if-eqz v4, :cond_5

    move-object v4, v1

    goto :goto_1

    :cond_5
    move-object v4, v3

    :goto_1
    :try_start_2
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 951
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    move-object/from16 v20, v15

    const-string v15, "unknown"

    if-nez v6, :cond_6

    :try_start_3
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    move-object v6, v15

    goto :goto_2

    .line 953
    :cond_6
    move-object v6, v4

    :goto_2
    invoke-virtual {v2, v0, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 954
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move-object v3, v15

    goto :goto_3

    .line 955
    :cond_7
    move-object v3, v0

    :goto_3
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7

    .line 956
    move-object/from16 v1, p0

    move-object/from16 v24, v12

    move-object v12, v2

    move-object v2, v5

    move-object/from16 v26, v3

    move-object/from16 v25, v20

    move-object/from16 v20, v15

    move v15, v4

    move-wide v3, v13

    move-wide/from16 v27, v21

    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-wide v5, v7

    :try_start_4
    invoke-virtual/range {v1 .. v6}, Lcom/melodix/music/PreviewPlayerController;->queueTick(Ljava/lang/String;JJ)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_7

    goto :goto_4

    :catch_0
    move-exception v0

    .line 957
    :goto_4
    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v12, v10, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-wide/16 v5, 0x0

    if-eqz v0, :cond_8

    cmp-long v0, v7, v5

    if-lez v0, :cond_8

    cmp-long v0, v13, v5

    if-ltz v0, :cond_8

    cmp-long v0, v13, v7

    if-gtz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_5

    :cond_8
    const/4 v0, 0x0

    .line 958
    :goto_5
    invoke-static/range {v25 .. v25}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static/range {v19 .. v19}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    cmp-long v1, v7, v5

    if-lez v1, :cond_9

    const/4 v1, 0x1

    goto :goto_6

    :cond_9
    const/4 v1, 0x0

    .line 960
    :goto_6
    if-eqz v1, :cond_d

    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v2, :cond_b

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v3, v25

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-object v2, v11, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 961
    move-object/from16 v4, v19

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    iget-wide v5, v11, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v2, v5, v7

    if-eqz v2, :cond_e

    goto :goto_7

    .line 960
    :cond_a
    move-object/from16 v4, v19

    goto :goto_7

    :cond_b
    move-object/from16 v4, v19

    move-object/from16 v3, v25

    .line 961
    :cond_c
    :goto_7
    const/4 v2, 0x1

    goto :goto_8

    .line 960
    :cond_d
    move-object/from16 v4, v19

    move-object/from16 v3, v25

    .line 961
    :cond_e
    const/4 v2, 0x0

    .line 962
    :goto_8
    iget-wide v5, v11, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    move-wide/from16 v10, v27

    cmp-long v5, v5, v10

    if-lez v5, :cond_10

    .line 964
    if-eqz v2, :cond_f

    move-wide/from16 v27, v7

    move-wide v5, v10

    const-wide/16 v7, -0x1

    move-object/from16 v11, p0

    iput-wide v7, v11, Lcom/melodix/music/PreviewPlayerController;->skipUntil:J

    iget-object v7, v11, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v8, v11, Lcom/melodix/music/PreviewPlayerController;->undim:Ljava/lang/Runnable;

    invoke-virtual {v7, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v11, v7}, Lcom/melodix/music/PreviewPlayerController;->dimTrack(F)V

    goto :goto_9

    .line 965
    :cond_f
    move-wide/from16 v27, v7

    move-wide v5, v10

    move-object/from16 v11, p0

    if-eqz v1, :cond_11

    return-void

    .line 962
    :cond_10
    move-wide/from16 v27, v7

    move-wide v5, v10

    move-object/from16 v11, p0

    .line 967
    :cond_11
    :goto_9
    invoke-direct {v11, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v7

    .line 968
    if-nez v2, :cond_12

    if-eqz v0, :cond_12

    move-wide/from16 v31, v7

    iget-wide v7, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v29, 0x0

    cmp-long v7, v7, v29

    if-ltz v7, :cond_13

    iget-wide v7, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v33, 0x7d0

    sub-long v7, v7, v33

    cmp-long v7, v13, v7

    if-gez v7, :cond_13

    const/4 v7, 0x1

    goto :goto_a

    :cond_12
    move-wide/from16 v31, v7

    :cond_13
    const/4 v7, 0x0

    .line 969
    :goto_a
    if-eqz v0, :cond_14

    if-nez v2, :cond_14

    if-nez v7, :cond_14

    iget-wide v7, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v29, 0x0

    cmp-long v7, v7, v29

    if-ltz v7, :cond_14

    iget-wide v7, v11, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v7, v13, v7

    if-eqz v7, :cond_14

    .line 970
    :cond_14
    iget-boolean v7, v11, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v7, :cond_15

    iget-boolean v7, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v7, :cond_15

    if-eqz v15, :cond_15

    iget-boolean v7, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v7, :cond_15

    if-nez v2, :cond_15

    const/4 v7, 0x1

    goto :goto_b

    :cond_15
    const/4 v7, 0x0

    .line 971
    :goto_b
    iget-boolean v8, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 972
    const-string v10, "previewProgressSource"

    invoke-virtual {v12, v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 973
    iget-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v25, v8

    move-object/from16 v8, v23

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_16

    iget-object v10, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move/from16 v23, v7

    const-string v7, "media"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_17

    iget-object v7, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    const-string v10, "clock"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_17

    iput-object v9, v11, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    goto :goto_c

    :cond_16
    move/from16 v23, v7

    .line 976
    :cond_17
    :goto_c
    const-string v7, "previewObservedAtMs"

    const-wide/16 v9, -0x1

    invoke-virtual {v12, v7, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v33

    .line 977
    const-wide/16 v9, 0x0

    cmp-long v7, v33, v9

    if-gez v7, :cond_18

    const-wide/16 v9, -0x1

    goto :goto_d

    :cond_18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long v9, v9, v33

    .line 978
    :goto_d
    iget-boolean v7, v11, Lcom/melodix/music/PreviewPlayerController;->foreground:Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7

    const-string v11, " ms ; \u00e2ge observation="

    move-object/from16 v33, v11

    const-string v11, "mesure="

    const-string v34, "inconnu"

    move-object/from16 v35, v11

    const-string v11, " ms"

    const-wide/16 v36, 0xbb8

    if-nez v7, :cond_1b

    .line 982
    if-eqz v0, :cond_19

    if-eqz v1, :cond_19

    const-wide/16 v7, 0x0

    cmp-long v0, v9, v7

    if-ltz v0, :cond_19

    cmp-long v0, v9, v36

    if-gez v0, :cond_19

    .line 983
    :try_start_6
    sput-wide v13, Lcom/melodix/music/PreviewPlayerController;->bgPos:J

    sput-wide v5, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    sput-boolean v15, Lcom/melodix/music/PreviewPlayerController;->bgPlaying:Z

    move-wide/from16 v5, v27

    sput-object p1, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 984
    const/4 v0, 0x1

    move-object/from16 v1, p0

    move-object v2, v12

    move-wide/from16 v27, v5

    move-wide v6, v7

    move-object/from16 v5, v22

    move-wide v6, v13

    move-object/from16 v29, v11

    move-wide v11, v9

    move-wide/from16 v8, v27

    move v10, v0

    invoke-direct/range {v1 .. v10}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJZ)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_e

    .line 1130
    :catch_1
    move-exception v0

    move-object/from16 v11, p0

    goto/16 :goto_3f

    .line 982
    :cond_19
    move-object/from16 v29, v11

    move-wide v11, v9

    .line 985
    const-wide/16 v1, -0x1

    :try_start_7
    sput-wide v1, Lcom/melodix/music/PreviewPlayerController;->bgAt:J

    const/4 v0, 0x0

    sput-object v0, Lcom/melodix/music/PreviewPlayerController;->bgJson:Ljava/lang/String;

    .line 986
    :goto_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, v35

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v9, 0x0

    cmp-long v1, v11, v9

    if-gez v1, :cond_1a

    :goto_f
    move-object/from16 v1, v34

    goto :goto_10

    :cond_1a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v2, v29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    goto :goto_f

    :goto_10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    move-object/from16 v1, p0

    :try_start_8
    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ; \u00e9tat page="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v2, v26

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ; rejet\u00e9e : arri\u00e8re-plan ; signal audio natif=non lu"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 988
    return-void

    .line 1130
    :catch_2
    move-exception v0

    goto :goto_11

    :catch_3
    move-exception v0

    move-object/from16 v1, p0

    :goto_11
    move-object v11, v1

    goto/16 :goto_3f

    .line 990
    :cond_1b
    move-object/from16 v7, v35

    move-object/from16 v35, v3

    move-object v3, v11

    move-wide/from16 v50, v9

    move-object/from16 v9, p0

    move-object/from16 v10, v26

    move-object/from16 v26, v12

    move-wide/from16 v11, v50

    move-object/from16 v52, v33

    move-object/from16 v33, v4

    move-object/from16 v4, v52

    :try_start_9
    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v38

    const-wide/high16 v39, 0x7ff8000000000000L    # Double.NaN

    move-object/from16 p1, v3

    if-eqz v38, :cond_1c

    move-object/from16 v38, v4

    move-wide/from16 v3, v39

    goto :goto_12

    :cond_1c
    move-object/from16 v38, v4

    long-to-double v3, v13

    sub-double v3, v3, v31

    .line 991
    :goto_12
    move-object/from16 v41, v10

    iget-boolean v10, v9, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v10, :cond_1d

    move-wide/from16 v42, v3

    iget-wide v3, v9, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    const-wide/16 v29, 0x0

    cmp-long v3, v3, v29

    if-ltz v3, :cond_1e

    iget-wide v3, v9, Lcom/melodix/music/PreviewPlayerController;->returnAt:J

    sub-long v3, v5, v3

    const-wide/16 v44, 0x3e8

    cmp-long v3, v3, v44

    if-ltz v3, :cond_1e

    if-eqz v0, :cond_1e

    const-wide/16 v3, 0x0

    cmp-long v10, v11, v3

    if-ltz v10, :cond_1e

    cmp-long v3, v11, v36

    if-gez v3, :cond_1e

    if-eqz v1, :cond_1e

    .line 992
    move-object/from16 v4, v20

    move-object/from16 v10, v22

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    const/4 v3, 0x1

    goto :goto_13

    .line 991
    :cond_1d
    move-wide/from16 v42, v3

    :cond_1e
    move-object/from16 v4, v20

    move-object/from16 v10, v22

    .line 992
    :cond_1f
    const/4 v3, 0x0

    .line 996
    :goto_13
    if-eqz v0, :cond_22

    const-wide/16 v29, 0x0

    cmp-long v20, v11, v29

    if-ltz v20, :cond_22

    cmp-long v20, v11, v36

    if-gez v20, :cond_22

    move-object/from16 v20, v4

    iget-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v4, :cond_23

    iget-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v4, :cond_23

    if-eqz v1, :cond_23

    if-nez v2, :cond_23

    iget-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_23

    if-eqz v15, :cond_23

    const-wide/16 v44, 0x2710

    move-wide/from16 v46, v5

    move-wide/from16 v4, v27

    cmp-long v6, v4, v44

    if-ltz v6, :cond_21

    .line 998
    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-nez v6, :cond_20

    move-object/from16 v22, v7

    sub-long v6, v4, v36

    long-to-double v6, v6

    cmpl-double v6, v31, v6

    if-ltz v6, :cond_24

    cmp-long v6, v13, v36

    if-gtz v6, :cond_24

    const/4 v6, 0x1

    goto :goto_15

    :cond_20
    move-object/from16 v22, v7

    goto :goto_14

    .line 996
    :cond_21
    move-object/from16 v22, v7

    goto :goto_14

    :cond_22
    move-object/from16 v20, v4

    :cond_23
    move-wide/from16 v46, v5

    move-object/from16 v22, v7

    move-wide/from16 v4, v27

    .line 998
    :cond_24
    :goto_14
    const/4 v6, 0x0

    .line 999
    :goto_15
    iget-object v7, v9, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-wide/16 v27, 0x1388

    if-eqz v7, :cond_25

    const-wide/16 v7, 0x1f40

    goto :goto_16

    :cond_25
    move-wide/from16 v7, v27

    .line 1000
    :goto_16
    if-nez v0, :cond_26

    const-string v0, "invalide"

    :goto_17
    move/from16 v36, v3

    move-wide/from16 v44, v4

    move-object v3, v0

    goto/16 :goto_18

    :cond_26
    const-wide/16 v29, 0x0

    cmp-long v0, v11, v29

    if-gez v0, :cond_27

    const-string v0, "\u00e2ge inconnu"

    goto :goto_17

    .line 1001
    :cond_27
    cmp-long v0, v11, v36

    if-ltz v0, :cond_28

    const-string v0, "observation ancienne"

    move/from16 v36, v3

    move-wide/from16 v44, v4

    move-object v3, v0

    goto :goto_18

    .line 1002
    :cond_28
    if-nez v1, :cond_29

    const-string v0, "identit\u00e9 incompl\u00e8te"

    move/from16 v36, v3

    move-wide/from16 v44, v4

    move-object v3, v0

    goto :goto_18

    .line 1003
    :cond_29
    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_2a

    if-nez v3, :cond_2a

    const-string v0, "attente retour 1 s"

    move/from16 v36, v3

    move-wide/from16 v44, v4

    move-object v3, v0

    goto :goto_18

    .line 1004
    :cond_2a
    if-nez v6, :cond_2b

    if-nez v3, :cond_2b

    if-nez v2, :cond_2b

    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_2b

    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v0, :cond_2b

    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_2b

    move/from16 v36, v3

    move-wide/from16 v44, v4

    long-to-double v3, v13

    sub-double v3, v3, v31

    .line 1005
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    long-to-double v7, v7

    cmpl-double v0, v3, v7

    if-ltz v0, :cond_2c

    const-string v0, "\u00e9cart >= seuil"

    move-object v3, v0

    goto :goto_18

    .line 1004
    :cond_2b
    move/from16 v36, v3

    move-wide/from16 v44, v4

    .line 1005
    :cond_2c
    move-object/from16 v3, v24

    .line 1008
    :goto_18
    const-string v0, "\u00e9cart >= seuil"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 1009
    const-wide/16 v4, 0x0

    cmpl-double v0, v42, v4

    if-lez v0, :cond_2d

    const/4 v0, 0x1

    goto :goto_19

    :cond_2d
    const/4 v0, -0x1

    .line 1010
    :goto_19
    iget-wide v4, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const-wide/16 v7, 0x0

    cmp-long v4, v4, v7

    if-ltz v4, :cond_2f

    iget-wide v4, v9, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    sub-long v4, v46, v4

    cmp-long v4, v4, v27

    if-gtz v4, :cond_2f

    iget v4, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    if-ne v0, v4, :cond_2f

    iget-object v4, v9, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iget-object v5, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2e

    goto :goto_1a

    :cond_2e
    move-wide/from16 v7, v46

    goto :goto_1b

    .line 1011
    :cond_2f
    :goto_1a
    move-wide/from16 v7, v46

    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    const/4 v4, 0x0

    iput v4, v9, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    iput v0, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSign:I

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    iput-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSource:Ljava/lang/String;

    .line 1013
    :goto_1b
    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->divergentLastAt:J

    iget v0, v9, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v5, 0x1

    add-int/2addr v0, v5

    iput v0, v9, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    .line 1014
    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_31

    iget v0, v9, Lcom/melodix/music/PreviewPlayerController;->divergentCount:I

    const/4 v5, 0x3

    if-lt v0, v5, :cond_31

    iget-wide v4, v9, Lcom/melodix/music/PreviewPlayerController;->divergentSince:J

    sub-long v4, v7, v4

    const-wide/16 v27, 0x2710

    cmp-long v0, v4, v27

    if-ltz v0, :cond_31

    .line 1015
    move-wide/from16 v4, v31

    iput-wide v4, v9, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    move/from16 v27, v6

    move-wide/from16 v46, v7

    long-to-double v6, v13

    sub-double/2addr v6, v4

    iput-wide v6, v9, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1016
    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_30

    const/4 v6, 0x0

    iput-boolean v6, v9, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 1017
    :cond_30
    const/4 v7, 0x1

    iput-boolean v7, v9, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 1018
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "resynchronisation douce ; \u00e9cart r\u00e9p\u00e9t\u00e9="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-wide/from16 v31, v4

    move-wide/from16 v7, v42

    double-to-long v4, v7

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v4, p1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1019
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_1c

    .line 1014
    :cond_31
    move-object/from16 v4, p1

    move/from16 v27, v6

    move-wide/from16 v46, v7

    move-wide/from16 v7, v42

    goto :goto_1c

    .line 1021
    :cond_32
    move-object/from16 v4, p1

    move/from16 v27, v6

    move-wide/from16 v7, v42

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    :goto_1c
    nop

    .line 1022
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    .line 1023
    nop

    .line 1024
    if-eqz v5, :cond_35

    if-nez v2, :cond_33

    move-wide/from16 v42, v7

    iget-wide v6, v9, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v28, 0x0

    cmp-long v0, v6, v28

    if-ltz v0, :cond_34

    iget-wide v6, v9, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v0, v13, v6

    if-eqz v0, :cond_36

    goto :goto_1d

    :cond_33
    move-wide/from16 v42, v7

    :cond_34
    :goto_1d
    const/4 v6, 0x1

    goto :goto_1e

    :cond_35
    move-wide/from16 v42, v7

    :cond_36
    const/4 v6, 0x0

    .line 1025
    :goto_1e
    iput-boolean v5, v9, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 1026
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, v22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v7, v38

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v7, 0x0

    cmp-long v22, v11, v7

    if-gez v22, :cond_37

    move-object/from16 v7, v34

    goto :goto_1f

    :cond_37
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_1f
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, " ; source="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v7, v9, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, " ; \u00e9tat page="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v7, v41

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, " ; \u00e9cart="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1027
    invoke-static/range {v42 .. v43}, Ljava/lang/Double;->isNaN(D)Z

    move-result v7

    if-eqz v7, :cond_38

    :goto_20
    move-object/from16 v4, v34

    goto :goto_21

    :cond_38
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-wide/from16 v11, v42

    double-to-long v11, v11

    invoke-virtual {v7, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    goto :goto_20

    :goto_21
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " ; "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1028
    if-eqz v5, :cond_39

    const-string v4, "accept\u00e9e"

    goto :goto_22

    :cond_39
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "rejet\u00e9e : "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_22
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1026
    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1029
    if-eqz v2, :cond_3c

    .line 1030
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->cancelSeek()V

    const-wide/16 v7, -0x1

    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    .line 1031
    const/4 v4, 0x0

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 1032
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->resetDivergence()V

    const-wide/16 v7, -0x1

    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    iput-wide v7, v9, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 1034
    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    move-object/from16 v7, v35

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-object/from16 v8, v33

    invoke-static {v0, v8}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3b

    goto :goto_23

    :cond_3a
    move-object/from16 v8, v33

    :goto_23
    const-wide/16 v11, -0x1

    iput-wide v11, v9, Lcom/melodix/music/PreviewPlayerController;->lastShownAt:J

    move-object/from16 v11, v24

    iput-object v11, v9, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 1036
    :cond_3b
    move-wide/from16 v11, v39

    goto :goto_24

    .line 1029
    :cond_3c
    move-object/from16 v8, v33

    move-object/from16 v7, v35

    move-wide/from16 v11, v31

    .line 1036
    :goto_24
    if-eqz v1, :cond_3d

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v4, v9, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-le v0, v4, :cond_3d

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-static {v0, v8}, Lcom/melodix/music/PreviewPlayerController;->sameArtists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3d

    iput-object v8, v9, Lcom/melodix/music/PreviewPlayerController;->fullArtist:Ljava/lang/String;

    .line 1037
    :cond_3d
    if-eqz v1, :cond_3e

    iput-object v7, v9, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    iput-object v8, v9, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    move-wide/from16 v31, v13

    move-wide/from16 v13, v44

    iput-wide v13, v9, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    const/4 v4, 0x1

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    goto :goto_25

    :cond_3e
    move-wide/from16 v31, v13

    move-wide/from16 v13, v44

    .line 1038
    :goto_25
    const/4 v4, 0x0

    :try_start_a
    invoke-virtual {v9, v4}, Lcom/melodix/music/PreviewPlayerController;->highlightPlaying(Z)V
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    goto :goto_26

    :catch_4
    move-exception v0

    .line 1039
    :goto_26
    :try_start_b
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_40

    if-eqz v2, :cond_3f

    goto :goto_27

    :cond_3f
    move/from16 p1, v6

    move-object/from16 v6, v21

    goto :goto_28

    :cond_40
    :goto_27
    move/from16 p1, v6

    move-object/from16 v6, v21

    iput-object v6, v9, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 1042
    :goto_28
    const-string v0, "previewConfirmPositionMs"

    move-object/from16 v21, v6

    move-object/from16 v35, v7

    move-wide/from16 v33, v11

    move-object/from16 v4, v26

    const-wide/16 v6, -0x1

    invoke-virtual {v4, v0, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v11

    .line 1043
    if-eqz v1, :cond_42

    const-wide/16 v6, 0x0

    cmp-long v0, v11, v6

    if-ltz v0, :cond_42

    cmp-long v0, v11, v13

    if-gtz v0, :cond_42

    .line 1044
    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-eqz v0, :cond_41

    if-nez v2, :cond_41

    iget v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_41

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v6, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v6, v0, v6

    const-wide/16 v28, 0x0

    cmp-long v0, v6, v28

    if-ltz v0, :cond_41

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v6, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v6, v0, v6

    const-wide/16 v28, 0x0

    cmp-long v0, v6, v28

    if-gez v0, :cond_41

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagBaseline:[J

    iget v6, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aget-wide v6, v0, v6

    cmp-long v0, v11, v6

    if-eqz v0, :cond_41

    .line 1046
    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagDifferent:[J

    iget v6, v9, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v46, v0, v6

    .line 1047
    :cond_41
    iput-wide v11, v9, Lcom/melodix/music/PreviewPlayerController;->independentObservation:J

    move-wide/from16 v6, v46

    iput-wide v6, v9, Lcom/melodix/music/PreviewPlayerController;->independentObservationAt:J

    goto :goto_29

    .line 1043
    :cond_42
    move-wide/from16 v6, v46

    .line 1049
    :goto_29
    if-eqz v5, :cond_43

    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-eqz v0, :cond_43

    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_43

    move-object/from16 v22, v8

    const/4 v8, 0x0

    iput-boolean v8, v9, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    goto :goto_2a

    :cond_43
    move-object/from16 v22, v8

    .line 1050
    :goto_2a
    if-eqz v36, :cond_44

    if-eqz v5, :cond_44

    .line 1051
    const/4 v8, 0x0

    iput-boolean v8, v9, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    iput-boolean v8, v9, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    .line 1052
    const-string v0, "retour confirm\u00e9 par observation coh\u00e9rente ; son non v\u00e9rifi\u00e9"

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1054
    :cond_44
    nop

    .line 1055
    iget-boolean v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    if-eqz v0, :cond_50

    if-nez v2, :cond_50

    .line 1056
    nop

    .line 1057
    if-eqz v15, :cond_45

    move/from16 v16, v1

    :try_start_c
    iget-wide v0, v9, Lcom/melodix/music/PreviewPlayerController;->seekAt:J

    sub-long v0, v6, v0

    const-wide/16 v8, 0x0

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1

    goto :goto_2b

    :cond_45
    move/from16 v16, v1

    const-wide/16 v0, 0x0

    .line 1058
    :goto_2b
    move-object/from16 v8, p0

    move-object/from16 v26, v10

    :try_start_d
    iget-wide v9, v8, Lcom/melodix/music/PreviewPlayerController;->seekTarget:J

    add-long/2addr v9, v0

    invoke-static {v13, v14, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 1059
    const-wide/16 v9, 0x0

    cmp-long v28, v11, v9

    if-ltz v28, :cond_46

    cmp-long v9, v11, v13

    if-gtz v9, :cond_46

    .line 1060
    iput-wide v11, v8, Lcom/melodix/music/PreviewPlayerController;->seekFallbackPosition:J

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->seekFallbackAt:J

    .line 1062
    :cond_46
    if-ltz v28, :cond_49

    sub-long v0, v11, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v9, 0x9c4

    cmp-long v0, v0, v9

    if-lez v0, :cond_47

    goto :goto_2c

    .line 1073
    :cond_47
    iget v0, v8, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    if-ltz v0, :cond_48

    iget-object v0, v8, Lcom/melodix/music/PreviewPlayerController;->seekDiagConfirm:[J

    iget v1, v8, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    aput-wide v6, v0, v1

    iget-object v0, v8, Lcom/melodix/music/PreviewPlayerController;->seekDiagOutcome:[Ljava/lang/String;

    iget v1, v8, Lcom/melodix/music/PreviewPlayerController;->seekDiagIndex:I

    const-string v5, "position UI proche de la cible"

    aput-object v5, v0, v1

    .line 1074
    :cond_48
    const/4 v1, 0x0

    iput-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    iget-wide v9, v8, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    const-wide/16 v31, 0x1

    add-long v9, v9, v31

    iput-wide v9, v8, Lcom/melodix/music/PreviewPlayerController;->seekSerial:J

    .line 1075
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    .line 1076
    const-wide/16 v9, -0x1

    iput-wide v9, v8, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v9, v8, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move v0, v5

    move-object/from16 v9, v20

    move-object/from16 v10, v26

    const/4 v3, 0x1

    goto/16 :goto_30

    .line 1063
    :cond_49
    :goto_2c
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_4a

    if-nez v15, :cond_4a

    invoke-direct {v8, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v2

    iput-wide v2, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v2, 0x0

    iput-wide v2, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1064
    :cond_4a
    if-eqz v15, :cond_4b

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_4b

    const/4 v13, 0x1

    goto :goto_2d

    :cond_4b
    const/4 v13, 0x0

    :goto_2d
    iput-boolean v13, v8, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v2, 0x1

    iput-boolean v2, v8, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 1065
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_4d

    if-nez v5, :cond_4c

    move-object/from16 v9, v20

    move-object/from16 v10, v26

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    goto :goto_2e

    :cond_4c
    move-object/from16 v9, v20

    move-object/from16 v10, v26

    :goto_2e
    iput-object v10, v8, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_2f

    :cond_4d
    move-object/from16 v9, v20

    move-object/from16 v10, v26

    .line 1066
    :cond_4e
    :goto_2f
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_4f

    if-eqz v5, :cond_4f

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4f

    .line 1067
    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    iput-boolean v15, v8, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_4f

    iput-boolean v15, v8, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 1069
    :cond_4f
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    return-void

    .line 1055
    :cond_50
    move/from16 v16, v1

    move-object v8, v9

    move-object/from16 v9, v20

    .line 1078
    move/from16 v0, p1

    move-wide/from16 v11, v31

    const/4 v3, 0x0

    :goto_30
    if-eqz v5, :cond_63

    .line 1079
    iput-wide v13, v8, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 1080
    iget-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_5d

    if-nez v2, :cond_5d

    if-nez v27, :cond_5d

    invoke-static/range {v33 .. v34}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_51

    move-object/from16 v26, v4

    move-object/from16 v20, v9

    move-object/from16 v17, v10

    goto/16 :goto_36

    .line 1083
    :cond_51
    if-eqz v36, :cond_57

    iget-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->seekPending:Z

    if-nez v1, :cond_57

    .line 1086
    if-eqz v15, :cond_53

    long-to-double v1, v11

    sub-double v1, v1, v33

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v1

    const-wide v17, 0x40a7700000000000L    # 3000.0

    cmpl-double v1, v1, v17

    if-ltz v1, :cond_52

    goto :goto_31

    :cond_52
    const/4 v1, 0x0

    goto :goto_32

    :cond_53
    :goto_31
    const/4 v1, 0x1

    .line 1087
    :goto_32
    if-eqz v1, :cond_54

    long-to-double v2, v11

    goto :goto_33

    :cond_54
    move-wide/from16 v2, v33

    :goto_33
    iput-wide v2, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    if-eqz v1, :cond_55

    const-wide/16 v2, 0x0

    goto :goto_34

    :cond_55
    long-to-double v2, v11

    sub-double v2, v2, v33

    :goto_34
    iput-wide v2, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1088
    if-eqz v1, :cond_56

    const-string v1, "retour : saut"

    goto :goto_35

    :cond_56
    const-string v1, "retour : correction <=1,25x"

    :goto_35
    invoke-direct {v8, v1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1089
    move-object/from16 v26, v4

    move-object/from16 v20, v9

    move-object/from16 v17, v10

    goto/16 :goto_37

    :cond_57
    if-eqz v3, :cond_58

    if-nez v15, :cond_58

    .line 1090
    long-to-double v1, v13

    move-object/from16 v26, v4

    move-wide/from16 v3, v33

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    move-object/from16 v20, v9

    move-object/from16 v17, v10

    const-wide/16 v9, 0x0

    invoke-static {v9, v10, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v1, v11

    sub-double/2addr v1, v3

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_37

    .line 1089
    :cond_58
    move-object/from16 v26, v4

    move-object/from16 v20, v9

    move-object/from16 v17, v10

    move-wide/from16 v3, v33

    .line 1091
    if-eqz v0, :cond_59

    if-nez v15, :cond_59

    if-nez v23, :cond_59

    .line 1092
    long-to-double v1, v13

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v3, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_37

    .line 1093
    :cond_59
    if-eqz v0, :cond_5a

    if-nez v23, :cond_5a

    .line 1094
    long-to-double v1, v13

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    const-wide/16 v9, 0x0

    invoke-static {v9, v10, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    long-to-double v1, v11

    sub-double/2addr v1, v3

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_37

    .line 1095
    :cond_5a
    if-eqz v25, :cond_5b

    if-eqz v15, :cond_5c

    if-nez v23, :cond_5c

    :cond_5b
    if-nez v25, :cond_5e

    if-eqz v15, :cond_5e

    .line 1096
    :cond_5c
    long-to-double v1, v13

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-wide v3, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto :goto_37

    .line 1080
    :cond_5d
    move-object/from16 v26, v4

    move-object/from16 v20, v9

    move-object/from16 v17, v10

    .line 1081
    :goto_36
    long-to-double v1, v11

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1082
    if-eqz v27, :cond_5e

    const-string v1, "retour d\u00e9but observ\u00e9 ; lecture non command\u00e9e"

    invoke-direct {v8, v1}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1098
    :cond_5e
    :goto_37
    if-eqz v0, :cond_60

    .line 1099
    iget-wide v0, v8, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v9, 0x0

    cmp-long v0, v0, v9

    if-ltz v0, :cond_5f

    iget-wide v0, v8, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v0, v0, v9

    if-ltz v0, :cond_5f

    if-eqz v15, :cond_5f

    .line 1100
    iget-object v0, v8, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    iget v1, v8, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget-wide v2, v8, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v2, v6, v2

    aput-wide v2, v0, v1

    .line 1101
    iget v0, v8, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v1, v8, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, v8, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 1102
    iget v0, v8, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    iget-object v1, v8, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v1, v1

    if-ge v0, v1, :cond_5f

    iget v0, v8, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, v8, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 1104
    :cond_5f
    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v11, v8, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    goto :goto_38

    .line 1098
    :cond_60
    const-wide/16 v9, 0x0

    .line 1106
    :goto_38
    const/4 v1, 0x1

    iput-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 1107
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-eqz v0, :cond_61

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_61

    iget-wide v0, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v0, v8, Lcom/melodix/music/PreviewPlayerController;->frozenPosition:D

    .line 1108
    :cond_61
    if-eqz v16, :cond_62

    if-eqz v15, :cond_62

    if-nez v23, :cond_62

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_62

    const/4 v0, 0x1

    goto :goto_39

    :cond_62
    const/4 v0, 0x0

    :goto_39
    iput-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_3b

    .line 1109
    :cond_63
    move-object/from16 v26, v4

    move-object/from16 v20, v9

    move-object/from16 v17, v10

    move-wide/from16 v3, v33

    const-wide/16 v9, 0x0

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_67

    if-nez v2, :cond_67

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_67

    .line 1110
    if-eqz v15, :cond_64

    if-eqz v23, :cond_65

    :cond_64
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->resyncing:Z

    if-nez v0, :cond_65

    iput-wide v3, v8, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v8, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 1111
    :cond_65
    if-eqz v15, :cond_66

    if-nez v23, :cond_66

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_66

    const/4 v0, 0x1

    goto :goto_3a

    :cond_66
    const/4 v0, 0x0

    :goto_3a
    iput-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_3b

    .line 1112
    :cond_67
    const/4 v1, 0x0

    iput-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    iput-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 1113
    :goto_3b
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_69

    if-nez v5, :cond_68

    move-object/from16 v4, v17

    move-object/from16 v3, v20

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    goto :goto_3c

    :cond_68
    move-object/from16 v4, v17

    move-object/from16 v3, v20

    :goto_3c
    iput-object v4, v8, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    goto :goto_3d

    :cond_69
    move-object/from16 v4, v17

    move-object/from16 v3, v20

    .line 1114
    :cond_6a
    :goto_3d
    const/4 v2, 0x1

    iput-boolean v2, v8, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 1115
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_6c

    if-eqz v5, :cond_6c

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6c

    .line 1116
    iput-wide v6, v8, Lcom/melodix/music/PreviewPlayerController;->lastConfirmedStateAt:J

    .line 1117
    iput-boolean v15, v8, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 1118
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_6b

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-ne v15, v0, :cond_6b

    const/4 v1, 0x0

    iput-boolean v1, v8, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-wide v0, v8, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v23, 0x1

    add-long v0, v0, v23

    iput-wide v0, v8, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 1119
    :cond_6b
    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_6c

    iput-boolean v15, v8, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 1121
    :cond_6c
    if-eqz v5, :cond_6d

    if-eqz v16, :cond_6d

    iget-boolean v0, v8, Lcom/melodix/music/PreviewPlayerController;->interrupted:Z

    if-nez v0, :cond_6d

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_5

    if-nez v0, :cond_6d

    .line 1122
    move-object/from16 v1, p0

    move-object/from16 v2, v26

    move-object v5, v3

    move-object/from16 v3, v35

    move-object/from16 v26, v4

    move-object/from16 v4, v22

    move-object v10, v5

    move-object/from16 v5, v26

    move-wide/from16 v48, v6

    move-object/from16 v9, v21

    move-wide v6, v11

    move-object v11, v8

    move-object v12, v9

    const-wide/16 v20, 0x0

    move-wide v8, v13

    :try_start_e
    invoke-direct/range {v1 .. v9}, Lcom/melodix/music/PreviewPlayerController;->saveLastTrack(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    goto :goto_3e

    .line 1121
    :cond_6d
    move-object/from16 v26, v4

    move-wide/from16 v48, v6

    move-object v11, v8

    move-object/from16 v12, v21

    move-wide/from16 v20, v9

    move-object v10, v3

    .line 1123
    :goto_3e
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 1124
    const-string v0, "apr\u00e8s mesure"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    .line 1125
    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v0, v20

    if-ltz v0, :cond_70

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    cmp-long v0, v0, v20

    if-ltz v0, :cond_70

    iget-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    cmp-long v0, v0, v20

    if-gez v0, :cond_70

    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6e

    .line 1126
    move-object/from16 v4, v26

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6e

    iget-boolean v0, v11, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eq v15, v0, :cond_6f

    :cond_6e
    iget v0, v11, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_70

    .line 1127
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_70

    iget-object v0, v11, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_70

    .line 1128
    :cond_6f
    move-wide/from16 v1, v48

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->uiAt:J
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_7

    .line 1134
    :cond_70
    goto :goto_41

    .line 1130
    :catch_5
    move-exception v0

    move-object v11, v8

    goto :goto_3f

    :catch_6
    move-exception v0

    move-object v11, v9

    goto :goto_3f

    :catch_7
    move-exception v0

    .line 1131
    :goto_3f
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {v11, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->positionUnderlying(J)D

    move-result-wide v0

    .line 1132
    iget-boolean v2, v11, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_71

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_71

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->base:D

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, v11, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v1, 0x0

    iput-wide v1, v11, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const/4 v1, 0x0

    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto :goto_40

    :cond_71
    const/4 v1, 0x0

    .line 1133
    :goto_40
    iput-boolean v1, v11, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    const-string v0, "mesure rejet\u00e9e : format invalide"

    invoke-direct {v11, v0}, Lcom/melodix/music/PreviewPlayerController;->recordReturn(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 1135
    :goto_41
    return-void
.end method

.method public tapPlayPause()I
    .locals 7

    .line 1145
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 1146
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

    .line 1147
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 1148
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v1

    .line 1149
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

    .line 1151
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

    .line 1152
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 1153
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 1154
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pulse:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1155
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$10;

    invoke-direct {v3, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$10;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    const-wide/16 v0, 0x1f40

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1162
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    return v0

    .line 1145
    :cond_7
    :goto_1
    return v1
.end method
