.class Landroidx/media/MediaBrowserServiceCompat$1;
.super Landroidx/media/MediaBrowserServiceCompat$Result;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowserServiceCompat;->performLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;Landroid/os/Bundle;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media/MediaBrowserServiceCompat$Result<",
        "Ljava/util/List<",
        "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaBrowserServiceCompat;

.field final synthetic val$connection:Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

.field final synthetic val$notifyChildrenChangedOptions:Landroid/os/Bundle;

.field final synthetic val$parentId:Ljava/lang/String;

.field final synthetic val$subscribeOptions:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroidx/media/MediaBrowserServiceCompat;Ljava/lang/Object;Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/MediaBrowserServiceCompat$1;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$connection:Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 4
    .line 5
    iput-object p4, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$parentId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$subscribeOptions:Landroid/os/Bundle;

    .line 8
    .line 9
    iput-object p6, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$notifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {p0, p2}, Landroidx/media/MediaBrowserServiceCompat$Result;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic onResultSent(Ljava/lang/Object;)V
    .locals 0

    .line 64
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Landroidx/media/MediaBrowserServiceCompat$1;->onResultSent(Ljava/util/List;)V

    return-void
.end method

.method public onResultSent(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/media/MediaBrowserServiceCompat$1;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/media/MediaBrowserServiceCompat;->mConnections:Lda;

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$connection:Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 6
    .line 7
    iget-object v1, v1, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

    .line 8
    .line 9
    invoke-interface {v1}, Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;->asBinder()Landroid/os/IBinder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$connection:Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 19
    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    sget-boolean p0, Landroidx/media/MediaBrowserServiceCompat;->DEBUG:Z

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    iget-object p0, v1, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->pkg:Ljava/lang/String;

    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Landroidx/media/MediaBrowserServiceCompat$Result;->getFlags()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    and-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Landroidx/media/MediaBrowserServiceCompat$1;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 38
    .line 39
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$subscribeOptions:Landroid/os/Bundle;

    .line 40
    .line 41
    invoke-virtual {v0, p1, v1}, Landroidx/media/MediaBrowserServiceCompat;->applyOptions(Ljava/util/List;Landroid/os/Bundle;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :cond_2
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$connection:Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 46
    .line 47
    iget-object v0, v0, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

    .line 48
    .line 49
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$parentId:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v2, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$subscribeOptions:Landroid/os/Bundle;

    .line 52
    .line 53
    iget-object v3, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$notifyChildrenChangedOptions:Landroid/os/Bundle;

    .line 54
    .line 55
    invoke-interface {v0, v1, p1, v2, v3}, Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;->onLoadChildren(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catch_0
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$1;->val$connection:Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 60
    .line 61
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->pkg:Ljava/lang/String;

    .line 62
    .line 63
    return-void
.end method
