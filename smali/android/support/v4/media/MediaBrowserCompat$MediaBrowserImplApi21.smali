.class Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImpl;
.implements Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserServiceCallbackImpl;
.implements Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback$ConnectionCallbackInternal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaBrowserCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaBrowserImplApi21"
.end annotation


# instance fields
.field protected final mBrowserFwk:Landroid/media/browse/MediaBrowser;

.field protected mCallbacksMessenger:Landroid/os/Messenger;

.field final mContext:Landroid/content/Context;

.field protected final mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

.field private mMediaSessionToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

.field private mNotifyChildrenChangedOptions:Landroid/os/Bundle;

.field protected final mRootHints:Landroid/os/Bundle;

.field protected mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

.field protected mServiceVersion:I

.field private final mSubscriptions:Lda;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lda;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/ComponentName;Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserServiceCallbackImpl;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 10
    .line 11
    new-instance v0, Lda;

    .line 12
    .line 13
    invoke-direct {v0}, Lu71;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mSubscriptions:Lda;

    .line 17
    .line 18
    iput-object p1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    new-instance v0, Landroid/os/Bundle;

    .line 21
    .line 22
    if-eqz p4, :cond_0

    .line 23
    .line 24
    invoke-direct {v0, p4}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 29
    .line 30
    .line 31
    :goto_0
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mRootHints:Landroid/os/Bundle;

    .line 32
    .line 33
    const-string p4, "extra_client_version"

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, p4, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    const-string p4, "extra_calling_pid"

    .line 40
    .line 41
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, p4, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p3, p0}, Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;->setInternalConnectionCallback(Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback$ConnectionCallbackInternal;)V

    .line 49
    .line 50
    .line 51
    new-instance p4, Landroid/media/browse/MediaBrowser;

    .line 52
    .line 53
    iget-object p3, p3, Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;->mConnectionCallbackFwk:Landroid/media/browse/MediaBrowser$ConnectionCallback;

    .line 54
    .line 55
    invoke-direct {p4, p1, p2, p3, v0}, Landroid/media/browse/MediaBrowser;-><init>(Landroid/content/Context;Landroid/content/ComponentName;Landroid/media/browse/MediaBrowser$ConnectionCallback;Landroid/os/Bundle;)V

    .line 56
    .line 57
    .line 58
    iput-object p4, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public connect()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/browse/MediaBrowser;->connect()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public disconnect()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->unregisterCallbackMessenger(Landroid/os/Messenger;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    :catch_0
    :cond_0
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/media/browse/MediaBrowser;->disconnect()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/browse/MediaBrowser;->getExtras()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getItem(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/media/browse/MediaBrowser;->isConnected()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 18
    .line 19
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$1;

    .line 20
    .line 21
    invoke-direct {v1, p0, p2, p1}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$1;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 33
    .line 34
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$2;

    .line 35
    .line 36
    invoke-direct {v1, p0, p2, p1}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$2;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;

    .line 44
    .line 45
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 46
    .line 47
    invoke-direct {v0, p1, p2, v1}, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;-><init>(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;Landroid/os/Handler;)V

    .line 48
    .line 49
    .line 50
    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 51
    .line 52
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 53
    .line 54
    invoke-virtual {v1, p1, v0, v2}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->getMediaItem(Ljava/lang/String;Ln11;Landroid/os/Messenger;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 59
    .line 60
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$3;

    .line 61
    .line 62
    invoke-direct {v1, p0, p2, p1}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$3;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    const-string p0, "cb is null"

    .line 70
    .line 71
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    const-string p0, "mediaId is empty"

    .line 76
    .line 77
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public getNotifyChildrenChangedOptions()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mNotifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoot()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/browse/MediaBrowser;->getRoot()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServiceComponent()Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/browse/MediaBrowser;->getServiceComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .locals 1

    .line 1
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mMediaSessionToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/media/browse/MediaBrowser;->getSessionToken()Landroid/media/session/MediaSession$Token;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->fromToken(Ljava/lang/Object;)Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mMediaSessionToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 16
    .line 17
    :cond_0
    return-object v0
.end method

.method public isConnected()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/browse/MediaBrowser;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onConnected()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/browse/MediaBrowser;->getExtras()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v1, "extra_service_version"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceVersion:I

    .line 18
    .line 19
    const-string v1, "extra_messenger"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    new-instance v2, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 28
    .line 29
    iget-object v3, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mRootHints:Landroid/os/Bundle;

    .line 30
    .line 31
    invoke-direct {v2, v1, v3}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;-><init>(Landroid/os/IBinder;Landroid/os/Bundle;)V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 35
    .line 36
    new-instance v1, Landroid/os/Messenger;

    .line 37
    .line 38
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 39
    .line 40
    invoke-direct {v1, v2}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 44
    .line 45
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;->setCallbacksMessenger(Landroid/os/Messenger;)V

    .line 48
    .line 49
    .line 50
    :try_start_1
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 51
    .line 52
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mContext:Landroid/content/Context;

    .line 53
    .line 54
    iget-object v3, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 55
    .line 56
    invoke-virtual {v1, v2, v3}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->registerCallbackMessenger(Landroid/content/Context;Landroid/os/Messenger;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    :cond_1
    const-string v1, "extra_session_binder"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Landroid/support/v4/media/session/IMediaSession$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaSession;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 72
    .line 73
    invoke-virtual {v1}, Landroid/media/browse/MediaBrowser;->getSessionToken()Landroid/media/session/MediaSession$Token;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1, v0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->fromToken(Ljava/lang/Object;Landroid/support/v4/media/session/IMediaSession;)Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mMediaSessionToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 82
    .line 83
    :catch_1
    :cond_2
    :goto_0
    return-void
.end method

.method public onConnectionFailed()V
    .locals 0

    .line 1
    return-void
.end method

.method public onConnectionFailed(Landroid/os/Messenger;)V
    .locals 0

    .line 2
    return-void
.end method

.method public onConnectionSuspended()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 3
    .line 4
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 5
    .line 6
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mMediaSessionToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 7
    .line 8
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;->setCallbacksMessenger(Landroid/os/Messenger;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onLoadChildren(Landroid/os/Messenger;Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Messenger;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;",
            "Landroid/os/Bundle;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mSubscriptions:Lda;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, p2, v0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/support/v4/media/MediaBrowserCompat$Subscription;

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    sget-object p0, Landroid/support/v4/media/MediaBrowserCompat;->EXTRA_PAGE:Ljava/lang/String;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-virtual {p1, p4}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->getCallback(Landroid/os/Bundle;)Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_5

    .line 25
    .line 26
    if-nez p4, :cond_3

    .line 27
    .line 28
    if-nez p3, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onError(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    iput-object p5, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mNotifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 35
    .line 36
    invoke-virtual {p1, p2, p3}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mNotifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    if-nez p3, :cond_4

    .line 43
    .line 44
    invoke-virtual {p1, p2, p4}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onError(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_4
    iput-object p5, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mNotifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 49
    .line 50
    invoke-virtual {p1, p2, p3, p4}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mNotifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 54
    .line 55
    :cond_5
    :goto_0
    return-void
.end method

.method public onServiceConnected(Landroid/os/Messenger;Ljava/lang/String;Landroid/support/v4/media/session/MediaSessionCompat$Token;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public search(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->isConnected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 12
    .line 13
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$4;

    .line 14
    .line 15
    invoke-direct {v1, p0, p3, p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$4;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$SearchResultReceiver;

    .line 23
    .line 24
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 25
    .line 26
    invoke-direct {v0, p1, p2, p3, v1}, Landroid/support/v4/media/MediaBrowserCompat$SearchResultReceiver;-><init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;Landroid/os/Handler;)V

    .line 27
    .line 28
    .line 29
    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 30
    .line 31
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 32
    .line 33
    invoke-virtual {v1, p1, p2, v0, v2}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->search(Ljava/lang/String;Landroid/os/Bundle;Ln11;Landroid/os/Messenger;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 38
    .line 39
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$5;

    .line 40
    .line 41
    invoke-direct {v1, p0, p3, p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$5;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const-string p0, "search() called while not connected"

    .line 49
    .line 50
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$CustomActionCallback;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->isConnected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 14
    .line 15
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$6;

    .line 16
    .line 17
    invoke-direct {v1, p0, p3, p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$6;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$CustomActionCallback;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$CustomActionResultReceiver;

    .line 24
    .line 25
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 26
    .line 27
    invoke-direct {v0, p1, p2, p3, v1}, Landroid/support/v4/media/MediaBrowserCompat$CustomActionResultReceiver;-><init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$CustomActionCallback;Landroid/os/Handler;)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 31
    .line 32
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 33
    .line 34
    invoke-virtual {v1, p1, p2, v0, v2}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;Ln11;Landroid/os/Messenger;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    if-eqz p3, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mHandler:Landroid/support/v4/media/MediaBrowserCompat$CallbackHandler;

    .line 44
    .line 45
    new-instance v1, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$7;

    .line 46
    .line 47
    invoke-direct {v1, p0, p3, p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21$7;-><init>(Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;Landroid/support/v4/media/MediaBrowserCompat$CustomActionCallback;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :cond_2
    const-string p0, ") with extras "

    .line 55
    .line 56
    const-string p3, " because the browser is not connected to the service."

    .line 57
    .line 58
    const-string v0, "Cannot send a custom action ("

    .line 59
    .line 60
    invoke-static {v0, p1, p0, p2, p3}, Lo40;->n(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public subscribe(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mSubscriptions:Lda;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/support/v4/media/MediaBrowserCompat$Subscription;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$Subscription;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mSubscriptions:Lda;

    .line 18
    .line 19
    invoke-virtual {v2, p1, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p3, v0}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->setSubscription(Landroid/support/v4/media/MediaBrowserCompat$Subscription;)V

    .line 23
    .line 24
    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance v1, Landroid/os/Bundle;

    .line 29
    .line 30
    invoke-direct {v1, p2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-virtual {v0, v1, p3}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->putCallback(Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 37
    .line 38
    if-nez p2, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 41
    .line 42
    iget-object p2, p3, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mSubscriptionCallbackFwk:Landroid/media/browse/MediaBrowser$SubscriptionCallback;

    .line 43
    .line 44
    invoke-virtual {p0, p1, p2}, Landroid/media/browse/MediaBrowser;->subscribe(Ljava/lang/String;Landroid/media/browse/MediaBrowser$SubscriptionCallback;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    :try_start_0
    iget-object p3, p3, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mToken:Landroid/os/IBinder;

    .line 49
    .line 50
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 51
    .line 52
    invoke-virtual {p2, p1, p3, v1, p0}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->addSubscription(Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;Landroid/os/Messenger;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :catch_0
    return-void
.end method

.method public unsubscribe(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V
    .locals 7

    .line 1
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mSubscriptions:Lda;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/support/v4/media/MediaBrowserCompat$Subscription;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 15
    .line 16
    if-nez v2, :cond_4

    .line 17
    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Landroid/media/browse/MediaBrowser;->unsubscribe(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_1
    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->getCallbacks()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->getOptionsList()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    add-int/lit8 v3, v3, -0x1

    .line 39
    .line 40
    :goto_0
    if-ltz v3, :cond_3

    .line 41
    .line 42
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-ne v4, p2, :cond_2

    .line 47
    .line 48
    invoke-interface {v1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    :cond_2
    add-int/lit8 v3, v3, -0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_7

    .line 62
    .line 63
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mBrowserFwk:Landroid/media/browse/MediaBrowser;

    .line 64
    .line 65
    invoke-virtual {v1, p1}, Landroid/media/browse/MediaBrowser;->unsubscribe(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_4
    if-nez p2, :cond_5

    .line 70
    .line 71
    :try_start_0
    iget-object v3, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 72
    .line 73
    invoke-virtual {v2, p1, v1, v3}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->removeSubscription(Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Messenger;)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_5
    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->getCallbacks()Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->getOptionsList()Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    add-int/lit8 v3, v3, -0x1

    .line 90
    .line 91
    :goto_1
    if-ltz v3, :cond_7

    .line 92
    .line 93
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    if-ne v4, p2, :cond_6

    .line 98
    .line 99
    iget-object v4, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mServiceBinderWrapper:Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;

    .line 100
    .line 101
    iget-object v5, p2, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mToken:Landroid/os/IBinder;

    .line 102
    .line 103
    iget-object v6, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mCallbacksMessenger:Landroid/os/Messenger;

    .line 104
    .line 105
    invoke-virtual {v4, p1, v5, v6}, Landroid/support/v4/media/MediaBrowserCompat$ServiceBinderWrapper;->removeSubscription(Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Messenger;)V

    .line 106
    .line 107
    .line 108
    invoke-interface {v1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    .line 114
    :cond_6
    add-int/lit8 v3, v3, -0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :catch_0
    :cond_7
    :goto_2
    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat$Subscription;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_8

    .line 122
    .line 123
    if-nez p2, :cond_9

    .line 124
    .line 125
    :cond_8
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$MediaBrowserImplApi21;->mSubscriptions:Lda;

    .line 126
    .line 127
    invoke-virtual {p0, p1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    :cond_9
    :goto_3
    return-void
.end method
