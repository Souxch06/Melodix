.class Lcom/melodix/music/PreviewPlayerTiles$1;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerTiles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 58
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerTiles;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$0(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
