.class Landroidx/media/MediaBrowserServiceCompat$3;
.super Landroidx/media/MediaBrowserServiceCompat$Result;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowserServiceCompat;->performSearch(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;Ln11;)V
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

.field final synthetic val$receiver:Ln11;


# direct methods
.method public constructor <init>(Landroidx/media/MediaBrowserServiceCompat;Ljava/lang/Object;Ln11;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/MediaBrowserServiceCompat$3;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/media/MediaBrowserServiceCompat$3;->val$receiver:Ln11;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroidx/media/MediaBrowserServiceCompat$Result;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic onResultSent(Ljava/lang/Object;)V
    .locals 0

    .line 45
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Landroidx/media/MediaBrowserServiceCompat$3;->onResultSent(Ljava/util/List;)V

    return-void
.end method

.method public onResultSent(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/media/MediaBrowserServiceCompat$Result;->getFlags()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v0, v0, 0x4

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v2, v1, [Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 19
    .line 20
    invoke-interface {p1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, [Landroid/os/Parcelable;

    .line 25
    .line 26
    const-string v2, "search_results"

    .line 27
    .line 28
    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$3;->val$receiver:Ln11;

    .line 32
    .line 33
    invoke-virtual {p0, v1, v0}, Ln11;->send(ILandroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$3;->val$receiver:Ln11;

    .line 38
    .line 39
    const/4 p1, -0x1

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, p1, v0}, Ln11;->send(ILandroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
