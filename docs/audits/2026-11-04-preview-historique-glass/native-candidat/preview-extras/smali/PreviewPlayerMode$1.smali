.class Lcom/melodix/music/PreviewPlayerMode$1;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 68
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$000(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$100(Lcom/melodix/music/PreviewPlayerMode;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$200(Lcom/melodix/music/PreviewPlayerMode;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$1;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$300(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x320

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    return-void

    .line 68
    :cond_1
    :goto_0
    return-void
.end method
