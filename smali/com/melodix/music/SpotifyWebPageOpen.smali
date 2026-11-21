.class public final Lcom/melodix/music/SpotifyWebPageOpen;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;
.field private final activity:Landroid/app/Activity;
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/SpotifyWebPageOpen;->activity:Landroid/app/Activity;
    return-void
.end method
.method public final onClick(Landroid/view/View;)V
    .locals 3
    iget-object v0, p0, Lcom/melodix/music/SpotifyWebPageOpen;->activity:Landroid/app/Activity;
    new-instance v1, Landroid/content/Intent;
    const-class v2, Lcom/melodix/music/SpotifyWebPageActivity;
    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    return-void
.end method
