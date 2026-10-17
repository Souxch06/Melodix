.class Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;->registerCallbacks(Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;Ljava/lang/String;IILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

.field final synthetic val$callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

.field final synthetic val$pid:I

.field final synthetic val$pkg:Ljava/lang/String;

.field final synthetic val$rootHints:Landroid/os/Bundle;

.field final synthetic val$uid:I


# direct methods
.method public constructor <init>(Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;ILjava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

    .line 4
    .line 5
    iput p3, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$uid:I

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$pkg:Ljava/lang/String;

    .line 8
    .line 9
    iput p5, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$pid:I

    .line 10
    .line 11
    iput-object p6, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$rootHints:Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

    .line 2
    .line 3
    invoke-interface {v0}, Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;->asBinder()Landroid/os/IBinder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

    .line 8
    .line 9
    iget-object v1, v1, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 10
    .line 11
    iget-object v1, v1, Landroidx/media/MediaBrowserServiceCompat;->mConnections:Lda;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

    .line 17
    .line 18
    iget-object v1, v1, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 19
    .line 20
    iget-object v1, v1, Landroidx/media/MediaBrowserServiceCompat;->mPendingConnections:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 38
    .line 39
    iget v4, v2, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->uid:I

    .line 40
    .line 41
    iget v5, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$uid:I

    .line 42
    .line 43
    if-ne v4, v5, :cond_0

    .line 44
    .line 45
    iget-object v4, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$pkg:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_1

    .line 52
    .line 53
    iget v4, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$pid:I

    .line 54
    .line 55
    if-gtz v4, :cond_2

    .line 56
    .line 57
    :cond_1
    new-instance v5, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 58
    .line 59
    iget-object v3, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

    .line 60
    .line 61
    iget-object v6, v3, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 62
    .line 63
    iget-object v7, v2, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->pkg:Ljava/lang/String;

    .line 64
    .line 65
    iget v8, v2, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->pid:I

    .line 66
    .line 67
    iget v9, v2, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;->uid:I

    .line 68
    .line 69
    iget-object v10, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$rootHints:Landroid/os/Bundle;

    .line 70
    .line 71
    iget-object v11, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

    .line 72
    .line 73
    invoke-direct/range {v5 .. v11}, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;-><init>(Landroidx/media/MediaBrowserServiceCompat;Ljava/lang/String;IILandroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;)V

    .line 74
    .line 75
    .line 76
    move-object v3, v5

    .line 77
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 78
    .line 79
    .line 80
    :cond_3
    if-nez v3, :cond_4

    .line 81
    .line 82
    new-instance v4, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;

    .line 83
    .line 84
    iget-object v1, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

    .line 85
    .line 86
    iget-object v5, v1, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 87
    .line 88
    iget-object v6, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$pkg:Ljava/lang/String;

    .line 89
    .line 90
    iget v7, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$pid:I

    .line 91
    .line 92
    iget v8, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$uid:I

    .line 93
    .line 94
    iget-object v9, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$rootHints:Landroid/os/Bundle;

    .line 95
    .line 96
    iget-object v10, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->val$callbacks:Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;

    .line 97
    .line 98
    invoke-direct/range {v4 .. v10}, Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;-><init>(Landroidx/media/MediaBrowserServiceCompat;Ljava/lang/String;IILandroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$ServiceCallbacks;)V

    .line 99
    .line 100
    .line 101
    move-object v3, v4

    .line 102
    :cond_4
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl$6;->this$1:Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;

    .line 103
    .line 104
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$ServiceBinderImpl;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 105
    .line 106
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat;->mConnections:Lda;

    .line 107
    .line 108
    invoke-virtual {p0, v0, v3}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x0

    .line 112
    :try_start_0
    invoke-interface {v0, v3, p0}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    .line 115
    :catch_0
    return-void
.end method
