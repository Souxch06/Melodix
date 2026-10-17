.class Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi29;
.super Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi24;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TransportControlsApi29"
.end annotation


# direct methods
.method public constructor <init>(Landroid/media/session/MediaController$TransportControls;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi24;-><init>(Landroid/media/session/MediaController$TransportControls;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public setPlaybackSpeed(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi21;->mControlsFwk:Landroid/media/session/MediaController$TransportControls;

    .line 7
    .line 8
    invoke-static {p0, p1}, Le1;->j(Landroid/media/session/MediaController$TransportControls;F)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p0, "speed must not be zero"

    .line 13
    .line 14
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
