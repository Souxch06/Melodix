.class Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;
.super Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TransportControlsBase"
.end annotation


# instance fields
.field private mBinder:Landroid/support/v4/media/session/IMediaSession;


# direct methods
.method public constructor <init>(Landroid/support/v4/media/session/IMediaSession;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public fastForward()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->fastForward()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public pause()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->pause()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public play()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->play()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public prepare()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->prepare()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public rewind()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->rewind()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public seekTo(J)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->seekTo(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public sendCustomAction(Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;Landroid/os/Bundle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat;->validateCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    return-void
.end method

.method public setCaptioningEnabled(Z)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/IMediaSession;->setCaptioningEnabled(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

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
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/IMediaSession;->setPlaybackSpeed(F)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :catch_0
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

.method public setRating(Landroid/support/v4/media/RatingCompat;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/IMediaSession;->rate(Landroid/support/v4/media/RatingCompat;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public setRating(Landroid/support/v4/media/RatingCompat;Landroid/os/Bundle;)V
    .locals 0

    .line 7
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->rateWithExtras(Landroid/support/v4/media/RatingCompat;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public setRepeatMode(I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/IMediaSession;->setRepeatMode(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public setShuffleMode(I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/IMediaSession;->setShuffleMode(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public skipToNext()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->next()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public skipToPrevious()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->previous()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public skipToQueueItem(J)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession;->skipToQueueItem(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;->mBinder:Landroid/support/v4/media/session/IMediaSession;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/IMediaSession;->stop()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method
