.class public final Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlaybackInfo"
.end annotation


# static fields
.field public static final PLAYBACK_TYPE_LOCAL:I = 0x1

.field public static final PLAYBACK_TYPE_REMOTE:I = 0x2


# instance fields
.field private final mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

.field private final mCurrentVolume:I

.field private final mMaxVolume:I

.field private final mPlaybackType:I

.field private final mVolumeControl:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 6

    .line 1
    new-instance v0, Landroidx/media/AudioAttributesCompat$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/media/AudioAttributesCompat$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Landroidx/media/AudioAttributesCompat$Builder;->setLegacyStreamType(I)Landroidx/media/AudioAttributesCompat$Builder;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2}, Landroidx/media/AudioAttributesCompat$Builder;->build()Landroidx/media/AudioAttributesCompat;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    move-object v0, p0

    .line 15
    move v1, p1

    .line 16
    move v3, p3

    .line 17
    move v4, p4

    .line 18
    move v5, p5

    .line 19
    invoke-direct/range {v0 .. v5}, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;-><init>(ILandroidx/media/AudioAttributesCompat;III)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(ILandroidx/media/AudioAttributesCompat;III)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput p1, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mPlaybackType:I

    .line 25
    iput-object p2, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    .line 26
    iput p3, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mVolumeControl:I

    .line 27
    iput p4, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mMaxVolume:I

    .line 28
    iput p5, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mCurrentVolume:I

    return-void
.end method


# virtual methods
.method public getAudioAttributes()Landroidx/media/AudioAttributesCompat;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioStream()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/media/AudioAttributesCompat;->getLegacyStreamType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCurrentVolume()I
    .locals 0

    .line 1
    iget p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mCurrentVolume:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxVolume()I
    .locals 0

    .line 1
    iget p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mMaxVolume:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlaybackType()I
    .locals 0

    .line 1
    iget p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mPlaybackType:I

    .line 2
    .line 3
    return p0
.end method

.method public getVolumeControl()I
    .locals 0

    .line 1
    iget p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;->mVolumeControl:I

    .line 2
    .line 3
    return p0
.end method
