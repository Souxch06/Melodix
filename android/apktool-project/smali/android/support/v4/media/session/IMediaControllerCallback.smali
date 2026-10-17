.class public interface abstract Landroid/support/v4/media/session/IMediaControllerCallback;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/IMediaControllerCallback$Stub;,
        Landroid/support/v4/media/session/IMediaControllerCallback$Default;
    }
.end annotation


# virtual methods
.method public abstract onCaptioningEnabledChanged(Z)V
.end method

.method public abstract onEvent(Ljava/lang/String;Landroid/os/Bundle;)V
.end method

.method public abstract onExtrasChanged(Landroid/os/Bundle;)V
.end method

.method public abstract onMetadataChanged(Landroid/support/v4/media/MediaMetadataCompat;)V
.end method

.method public abstract onPlaybackStateChanged(Landroid/support/v4/media/session/PlaybackStateCompat;)V
.end method

.method public abstract onQueueChanged(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onQueueTitleChanged(Ljava/lang/CharSequence;)V
.end method

.method public abstract onRepeatModeChanged(I)V
.end method

.method public abstract onSessionDestroyed()V
.end method

.method public abstract onSessionReady()V
.end method

.method public abstract onShuffleModeChanged(I)V
.end method

.method public abstract onShuffleModeChangedRemoved(Z)V
.end method

.method public abstract onVolumeInfoChanged(Landroid/support/v4/media/session/ParcelableVolumeInfo;)V
.end method
