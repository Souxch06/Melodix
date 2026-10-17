.class Landroidx/media/MediaBrowserServiceCompat$4;
.super Landroidx/media/MediaBrowserServiceCompat$Result;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowserServiceCompat;->performCustomAction(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$ConnectionRecord;Ln11;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media/MediaBrowserServiceCompat$Result<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaBrowserServiceCompat;

.field final synthetic val$receiver:Ln11;


# direct methods
.method public constructor <init>(Landroidx/media/MediaBrowserServiceCompat;Ljava/lang/Object;Ln11;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/MediaBrowserServiceCompat$4;->this$0:Landroidx/media/MediaBrowserServiceCompat;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/media/MediaBrowserServiceCompat$4;->val$receiver:Ln11;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroidx/media/MediaBrowserServiceCompat$Result;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onErrorSent(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$4;->val$receiver:Ln11;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0, v0, p1}, Ln11;->send(ILandroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onProgressUpdateSent(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$4;->val$receiver:Ln11;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0, p1}, Ln11;->send(ILandroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onResultSent(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/media/MediaBrowserServiceCompat$4;->val$receiver:Ln11;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Ln11;->send(ILandroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic onResultSent(Ljava/lang/Object;)V
    .locals 0

    .line 8
    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Landroidx/media/MediaBrowserServiceCompat$4;->onResultSent(Landroid/os/Bundle;)V

    return-void
.end method
