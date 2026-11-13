.class public final Lcom/melodix/music/SpotifyWebPageClose;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;
.field private final activity:Landroid/app/Activity;
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/SpotifyWebPageClose;->activity:Landroid/app/Activity;
    return-void
.end method
.method public final onClick(Landroid/view/View;)V
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/SpotifyWebPageClose;->activity:Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    return-void
.end method
