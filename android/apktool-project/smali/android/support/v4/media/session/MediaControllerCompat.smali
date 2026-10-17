.class public final Landroid/support/v4/media/session/MediaControllerCompat;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi29;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi24;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi23;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi21;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi29;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsBase;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplBase;,
        Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;,
        Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;,
        Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;,
        Landroid/support/v4/media/session/MediaControllerCompat$Callback;
    }
.end annotation


# static fields
.field public static final COMMAND_ADD_QUEUE_ITEM:Ljava/lang/String; = "android.support.v4.media.session.command.ADD_QUEUE_ITEM"

.field public static final COMMAND_ADD_QUEUE_ITEM_AT:Ljava/lang/String; = "android.support.v4.media.session.command.ADD_QUEUE_ITEM_AT"

.field public static final COMMAND_ARGUMENT_INDEX:Ljava/lang/String; = "android.support.v4.media.session.command.ARGUMENT_INDEX"

.field public static final COMMAND_ARGUMENT_MEDIA_DESCRIPTION:Ljava/lang/String; = "android.support.v4.media.session.command.ARGUMENT_MEDIA_DESCRIPTION"

.field public static final COMMAND_GET_EXTRA_BINDER:Ljava/lang/String; = "android.support.v4.media.session.command.GET_EXTRA_BINDER"

.field public static final COMMAND_REMOVE_QUEUE_ITEM:Ljava/lang/String; = "android.support.v4.media.session.command.REMOVE_QUEUE_ITEM"

.field public static final COMMAND_REMOVE_QUEUE_ITEM_AT:Ljava/lang/String; = "android.support.v4.media.session.command.REMOVE_QUEUE_ITEM_AT"

.field static final TAG:Ljava/lang/String; = "MediaControllerCompat"


# instance fields
.field private final mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

.field private final mRegisteredCallbacks:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Landroid/support/v4/media/session/MediaControllerCompat$Callback;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mRegisteredCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz p2, :cond_0

    .line 50
    iput-object p2, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 51
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    return-void

    .line 52
    :cond_0
    const-string p0, "sessionToken must not be null"

    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mRegisteredCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iput-object p2, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 18
    .line 19
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    const/16 v1, 0x1d

    .line 22
    .line 23
    if-lt v0, v1, :cond_0

    .line 24
    .line 25
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi29;

    .line 26
    .line 27
    invoke-direct {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi29;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;

    .line 34
    .line 35
    invoke-direct {v0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string p0, "session must not be null"

    .line 42
    .line 43
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    throw p0
.end method

.method public static getMediaController(Landroid/app/Activity;)Landroid/support/v4/media/session/MediaControllerCompat;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Landroidx/media/R$id;->media_controller_compat_view_tag:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v1, v0, Landroid/support/v4/media/session/MediaControllerCompat;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    check-cast v0, Landroid/support/v4/media/session/MediaControllerCompat;

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    invoke-static {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;->getMediaController(Landroid/app/Activity;)Landroid/support/v4/media/session/MediaControllerCompat;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static setMediaController(Landroid/app/Activity;Landroid/support/v4/media/session/MediaControllerCompat;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Landroidx/media/R$id;->media_controller_compat_view_tag:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImplApi21;->setMediaController(Landroid/app/Activity;Landroid/support/v4/media/session/MediaControllerCompat;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static validateCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "android.support.v4.media.session.action.FOLLOW"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "android.support.v4.media.session.action.UNFOLLOW"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const-string v0, "android.support.v4.media.session.ARGUMENT_MEDIA_ATTRIBUTE"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    :goto_0
    return-void

    .line 32
    :cond_2
    const-string p1, "An extra field android.support.v4.media.session.ARGUMENT_MEDIA_ATTRIBUTE is required for this action "

    .line 33
    .line 34
    const-string v0, "."

    .line 35
    .line 36
    invoke-static {p1, p0, v0}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public addQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->addQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;I)V
    .locals 0

    .line 7
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->addQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;I)V

    return-void
.end method

.method public adjustVolume(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->adjustVolume(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public dispatchMediaButtonEvent(Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->dispatchMediaButtonEvent(Landroid/view/KeyEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const-string p0, "KeyEvent may not be null"

    .line 11
    .line 12
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getExtras()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFlags()J
    .locals 2

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getFlags()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getMediaController()Ljava/lang/Object;
    .locals 0

    .line 27
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getMediaController()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getMetadata()Landroid/support/v4/media/MediaMetadataCompat;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getMetadata()Landroid/support/v4/media/MediaMetadataCompat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPlaybackInfo()Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getPlaybackInfo()Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getQueue()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getQueue()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getQueueTitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getQueueTitle()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRatingType()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getRatingType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRepeatMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getRepeatMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSession2Token()Lfh1;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->getSession2Token()Lfh1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSessionActivity()Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getSessionActivity()Landroid/app/PendingIntent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSessionInfo()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getSessionInfo()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShuffleMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getShuffleMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isCaptioningEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->isCaptioningEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isSessionReady()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->isSessionReady()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/session/MediaControllerCompat;->registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V

    return-void
.end method

.method public registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mRegisteredCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    if-nez p2, :cond_1

    .line 15
    .line 16
    new-instance p2, Landroid/os/Handler;

    .line 17
    .line 18
    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->setHandler(Landroid/os/Handler;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 25
    .line 26
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const-string p0, "callback must not be null"

    .line 31
    .line 32
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public removeQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->removeQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeQueueItemAt(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getQueue()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-ltz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge p1, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;->getDescription()Landroid/support/v4/media/MediaDescriptionCompat;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat;->removeQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "command must neither be null nor empty"

    .line 14
    .line 15
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setVolumeTo(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->setVolumeTo(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public unregisterCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mRegisteredCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :try_start_0
    iget-object p0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->mImpl:Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$MediaControllerImpl;->unregisterCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->setHandler(Landroid/os/Handler;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    invoke-virtual {p1, v0}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->setHandler(Landroid/os/Handler;)V

    .line 24
    .line 25
    .line 26
    throw p0

    .line 27
    :cond_1
    const-string p0, "callback must not be null"

    .line 28
    .line 29
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
