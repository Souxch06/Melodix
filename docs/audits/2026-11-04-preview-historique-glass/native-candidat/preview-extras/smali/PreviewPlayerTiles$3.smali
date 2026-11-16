.class Lcom/melodix/music/PreviewPlayerTiles$3;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->onWindowVisibilityChanged(I)V
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
    .line 52
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;)V

    return-void
.end method
