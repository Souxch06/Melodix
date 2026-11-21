.class Lcom/melodix/music/PreviewPlayerController$12;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->showDiagnostics()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1196
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1197
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4800(Lcom/melodix/music/PreviewPlayerController;)I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$4900(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    .line 1198
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v1

    const-wide/16 v3, 0x1388

    add-long/2addr v1, v3

    .line 1199
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerController;->access$4200(Lcom/melodix/music/PreviewPlayerController;)Landroid/os/Handler;

    move-result-object v3

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$12$1;

    invoke-direct {v4, p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController$12$1;-><init>(Lcom/melodix/music/PreviewPlayerController$12;IJ)V

    const-wide/16 v0, 0xc8

    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1203
    return-void
.end method
